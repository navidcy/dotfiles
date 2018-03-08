#!/usr/bin/env python
from subprocess import check_output

def get_pass(account):
    return check_output("pass Email/" + account, shell=True).splitlines()[0]

if __name__ == "__main__":
    import sys
    if sys.version_info[0] < 3:
        print(get_pass(sys.argv[1]))
    else:
        print(get_pass(sys.argv[1]).decode("utf-8"))
