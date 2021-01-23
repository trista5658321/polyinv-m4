import pathlib

LENGTH = 16
FILE_NAME = "jump" + str(LENGTH) + "_2x2"

# For the directory of the script being run:
PATH_DIR = pathlib.Path(__file__).parent.absolute()

f = open(PATH_DIR.joinpath("./origin/",FILE_NAME + ".S"))
new_f = open(PATH_DIR.joinpath("new_" + FILE_NAME + ".S"), 'w')
code_list = f.readlines()
for code in code_list:
    if "r1," in code or "r2," in code:
        pos = code.index("[")
        code_l = code[:pos+1]
        code_r = code[pos+3:]
        reg_name = ["r1", "r2"]["r1," in code]
        new_f.write(code_l + reg_name + code_r)
    else:
        new_f.write(code)

f.close()
new_f.close()