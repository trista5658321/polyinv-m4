PATH_R_PQM4 = "../pqm4/crypto_kem/sntrup761/m4f/"
PATH_DEST = "./"
LENGTH = 64
FILE_NAME = "polymul_" + str(LENGTH) + "x" + str(LENGTH)

IGNORE_LIST = [
    "push.w {r4-r12, lr}",
    "movw.w r3, #18015",
    "movt.w r3, #14",
    "vmov.w s2, r3",
    "pop.w {r4-r12, pc}"
]
# IGNORE_LIST = []

f = open(PATH_R_PQM4 + FILE_NAME + ".S")
code_list = f.readlines()

new_file = open(PATH_DEST+ FILE_NAME + ".py", "w")
new_file.write("from utility import *\n\n")
new_file.write("def " + FILE_NAME + "():\n")

write_flag = False
r0_offset = 0
r0_list = []

for code in code_list:
    if write_flag:
        code = code.strip()
        if not code in IGNORE_LIST:
            if "r0" in code:
                code_l = code[:code.index("[")]
                if len(r0_list) == 0:
                    code_r = "[r0, #" + str(r0_offset+4) + "]"
                    r0_list.append(code_l+code_r)
                    continue
                else:
                    code_r = "[r0, #" + str(r0_offset) + "]"
                    r0_offset += 8
                    new_file.write('    printIn("' + code_l+code_r + '")\n')
                    code = r0_list.pop()
            new_file.write('    printIn("' + code + '")\n')

    if not write_flag and (":") in code:
        write_flag = True

f.close()
new_file.close()