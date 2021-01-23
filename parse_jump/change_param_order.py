import pathlib

LENGTH = 32
FILE_NAME = "jump" + str(LENGTH) + "_2x2"

# For the directory of the script being run:
PATH_DIR = pathlib.Path(__file__).parent.absolute()

f = open(PATH_DIR.joinpath("./origin/",FILE_NAME + ".S"))
new_f = open(PATH_DIR.joinpath("new_" + FILE_NAME + ".S"), 'w')
code_list = f.readlines()
for code in code_list:
    if "r1," in code or "r2," in code:
        reg_name = ["r2", "r1"]["r1," in code]
        pos = code.index(reg_name)
        code_l = code[:pos]
        code_r = code[pos+2:]
        new_reg_name = ["r2", "r1"]["r2" == reg_name]
        new_f.write(code_l + new_reg_name + code_r)
    else:
        new_f.write(code)

f.close()
new_f.close()