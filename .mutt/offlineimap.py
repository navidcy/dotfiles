#!/usr/bin/python
import re
import subprocess
import getpass
import os
import sys
if sys.platform == 'linux2':
    import gnomekeyring as gkey


user = getpass.getuser()
home = os.getenv('HOME')


def get_keychain_pass(account=None, server=None):
    if sys.platform == 'darwin':
        command = 'sudo -u ' + user + \
            ' /usr/bin/security -v find-internet-password -g -a ' + account +\
            ' -s ' + server + ' ' + home + '/Library/Keychains/login.keychain'
        output = subprocess.check_output(command, shell=True,
                                         stderr=subprocess.STDOUT)
        outtext = [l for l in output.splitlines()
                   if l.startswith('password: ')][0]

        return re.match(r'password: "(.*)"', outtext).group(1)

    elif sys.platform == 'linux2':

        attrs = {'server': server, 'protocol': 'http'}
        items = gkey.find_items_sync(gkey.ITEM_NETWORK_PASSWORD, attrs)
        return (items[0].attributes['user'], items[0].secret)[1]

    else:
        raise Exception('Platform "' + sys.platform + '" not supported.')


def set_keychain_pass(protocol, server, user, password):
    if sys.platform != 'linux2':
        raise Exception('Only Linux is supported for setting passwords.')

    attrs = {'user': user,
             'server': server,
             'protocol': protocol}
    name = 'offlineimap ' + server

    gkey.item_create_sync(gkey.get_default_keyring_sync(),
                          gkey.ITEM_NETWORK_PASSWORD,
                          name, attrs, password, True)

if __name__ == '__main__':
    account = sys.argv[1]
    server = sys.argv[2]
    print(get_keychain_pass(account=account, server=server))
