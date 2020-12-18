import pathlib

# 1. s0-s16 => s9-s25
# 2. use s2 instead of "movw.w r4, #18015 / movt.w r4, #14"
# 3. ignore "Toom4Table_4591" , "vldm r10, {s1-s16} @ read table"

LENGTH = 128
FILE_NAME = "polymul_" + str(LENGTH) + "x" + str(LENGTH)

# For the directory of the script being run:
PATH_DIR = pathlib.Path(__file__).parent.absolute()

PATH_PQM4 = PATH_DIR.parent.parent
PATH_DEST = PATH_DIR

IGNORE_LIST = [
    "push.w {r4-r12, lr}",
    "vpush.w { s16 }",
    "movw.w r10, :lower16:Toom4Table_4591",
    "movt.w r10, :upper16:Toom4Table_4591",
    "vldm	r10, {s1-s16} @ read table",
    "vldm r10, {s1-s16} @ read table",
    "vpop.w { s16 }",
    "pop.w {r4-r12, pc}"
]
# IGNORE_LIST = []

f = open(PATH_PQM4.joinpath("pqm4/crypto_kem/sntrup761/m4f", FILE_NAME + ".S"))
code_list = f.readlines()

new_file = open(PATH_DEST.joinpath(FILE_NAME + ".py"), "w")
new_file.write("import sys, pathlib\n")
new_file.write("sys.path.append(str(pathlib.Path(__file__).parent.absolute().parent))\n\n")
new_file.write("from utility import printIn\n\n")
new_file.write("def polymul(label_postfix):\n")

write_flag = False
stop_s1_to_s3 = False

def check_s(code):
    s_list = [ "s" + str(x) for x in range(17)]
    idx = -1
    for s in s_list:
        if s in code:
            idx = int(s[1:])
    return idx

for code in code_list:
    if write_flag:
        code = code.strip()
        if code == "Toom4Table_4591:":
            break
        if code == IGNORE_LIST[2]:
            stop_s1_to_s3 = True
        if not code in IGNORE_LIST:
            if "#14" in code:
                continue
            elif "#18015" in code:
                rd = code[7:code.index("#18015")-2]
                code = "vmov.w " + rd + ", s2"
            elif "s" in code:
                reg_index = check_s(code)
                if reg_index >= 0:
                    s_reg_name = "s" + str(reg_index)
                    pos = code.index(s_reg_name)
                    code_l = code[:pos]
                    code_r = code[pos+len(s_reg_name):]
                    if not stop_s1_to_s3 and reg_index == 1:
                        code = code_l + "s3" + code_r
                    else:
                        code = code_l + "s" + str(reg_index+9) + code_r

            if ":" in code:
                label = code[:-1]
                new_file.write('    print("' + label + '" + label_postfix + ":")\n')
            elif "bne" in code:
                new_file.write('    printIn("' + code + '" + label_postfix)\n')
            else:
                new_file.write('    printIn("' + code + '")\n')

    if not write_flag and (":") in code:
        write_flag = True

# new_file.write('polymul_128x128("hey")')
f.close()
new_file.close()