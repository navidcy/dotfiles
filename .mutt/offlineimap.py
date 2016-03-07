#!/usr/bin/python
import re
import subprocess
import getpass
import os
import sys


user = getpass.getuser()
home = os.getenv('HOME')


def get_keychain_pass_osx(account=None, server=None):
    if sys.platform == 'darwin':
        command = 'sudo -u ' + user + \
            ' /usr/bin/security -v find-internet-password -g -a ' + account +\
            ' -s ' + server + ' ' + home + '/Library/Keychains/login.keychain'
        output = subprocess.check_output(command, shell=True,
                                         stderr=subprocess.STDOUT)
        outtext = [l for l in output.splitlines()
                   if l.startswith('password: ')][0]

        return re.match(r'password: "(.*)"', outtext).group(1)
