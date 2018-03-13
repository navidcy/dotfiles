-- see `man imapfilter_config` for info

-------------
-- Options --
-------------
options.timeout = 120
options.subscribe = true
--options.namespace = false
--options.create = true

-- for debugging purposes
options.info = true



-- function to strip trailing newlines piped from ~/.mutt/offlineimap.py
function trim(s)
    return (s:gsub("^%s*(.-)%s*$", "%1"))
end


--------------
-- Accounts --
--------------

status, pass = pipe_from("python ~/.mutt/offlineimap-password-store.py anders@adamsgaard.dk-imap")
account = IMAP {
    server = 'imap.fastmail.com',
    username = 'anders@adamsgaard.dk',
    password = trim(pass),
    ssl = 'ssl23'
}

-- Get a list of the available mailboxes and folders
mailboxes, folders = account:list_all()

-- Get a list of the subscribed mailboxes and folders
mailboxes, folders = account:list_subscribed()


-------------------
-- Mailbox rules --
-------------------

-- Get the status of a mailbox
--account.INBOX:check_status()

-- Get all the messages in the mailbox
--results = account.INBOX:select_all()

-- Get newly arrived, unread messages
--results = account.INBOX:is_new()

--------------------
-- Spam filtering --
--------------------
--all = account.INBOX:select_all()
all = account.INBOX:is_new()
spam = Set {}
unsure = Set {}
for _, msg in ipairs(all) do
    mbox, uid = unpack(msg)
    text = mbox[uid]:fetch_message()
    flag = pipe_to('bogofilter', text)
    if (flag == 0) then
        table.insert(spam, msg)
    elseif (flag == 2) then
        table.insert(unsure, msg)
    end
end
--account:create_mailbox('Spam/unsure')
spam:move_messages(account['Spam'])
--unsure:copy_messages(account['Junk/unsure'])
unsure:move_messages(account['Spam/unsure'])


-- Debian announcements list --
addr = 'debian-announce@lists.debian.org'
mailbox = 'debian/debian-announce'
--account:create_mailbox(mailbox)
--account:subscribe_mailbox(mailbox)
results = account.INBOX:contain_to(addr) + account.INBOX:contain_cc(addr)
results:move_messages(account[mailbox])

-- Debian laptop list --
addr = 'debian-laptop@lists.debian.org'
mailbox = 'debian/debian-laptop'
--account:create_mailbox(mailbox)
--account:subscribe_mailbox(mailbox)
results = account.INBOX:contain_to(addr) + account.INBOX:contain_cc(addr)
results:move_messages(account[mailbox])

-- Debian news list --
addr = 'debian-news@lists.debian.org'
mailbox = 'debian/debian-news'
--account:create_mailbox(mailbox)
--account:subscribe_mailbox(mailbox)
results = account.INBOX:contain_to(addr) + account.INBOX:contain_cc(addr)
results:move_messages(account[mailbox])

-- Debian photo list --
addr = 'debian-photo@lists.debian.org'
mailbox = 'debian/debian-photo'
--account:create_mailbox(mailbox)
--account:subscribe_mailbox(mailbox)
results = account.INBOX:contain_to(addr) + account.INBOX:contain_cc(addr)
results:move_messages(account[mailbox])

-- Debian security list --
addr = 'debian-security-announce@lists.debian.org'
mailbox = 'debian/debian-security-announce'
--account:create_mailbox(mailbox)
--account:subscribe_mailbox(mailbox)
results = account.INBOX:contain_to(addr) + account.INBOX:contain_cc(addr)
results:move_messages(account[mailbox])

-- Debian security list --
addr = 'debian-security@lists.debian.org'
mailbox = 'debian/debian-security'
----account:create_mailbox(mailbox)
--account:subscribe_mailbox(mailbox)
results = account.INBOX:contain_to(addr) + account.INBOX:contain_cc(addr)
results:move_messages(account[mailbox])

-- Debian danish list --
addr = 'debian-user-danish@lists.debian.org'
mailbox = 'debian/debian-user-danish'
--account:create_mailbox(mailbox)
--account:subscribe_mailbox(mailbox)
results = account.INBOX:contain_to(addr) + account.INBOX:contain_cc(addr)
results:move_messages(account[mailbox])

-- Debian security announcements list --
addr = 'debian-security-announce@lists.debian.org'
mailbox = 'debian/debian-security'
--account:create_mailbox(mailbox)
--account:subscribe_mailbox(mailbox)
results = account.INBOX:contain_to(addr) + account.INBOX:contain_cc(addr)
results:move_messages(account[mailbox])

-- Debian testing security announcements list --
addr = 'debian-testing-security-announce@lists.debian.org'
mailbox = 'debian/debian-security'
----account:create_mailbox(mailbox)
--account:subscribe_mailbox(mailbox)
results = account.INBOX:contain_to(addr) + account.INBOX:contain_cc(addr)
results:move_messages(account[mailbox])

-- Debian science list --
addr = 'debian-science@lists.debian.org'
mailbox = 'debian/debian-science'
--account:create_mailbox(mailbox)
--account:subscribe_mailbox(mailbox)
results = account.INBOX:contain_to(addr) + account.INBOX:contain_cc(addr)
results:move_messages(account[mailbox])

-- VTK users list --
addr = 'vtkusers@vtk.org'
mailbox = 'vtk-users'
--account:create_mailbox(mailbox)
--account:subscribe_mailbox(mailbox)
results = account.INBOX:contain_to(addr) + account.INBOX:contain_cc(addr)
results:move_messages(account[mailbox])

-- Paraview list
addr = 'paraview@paraview.org'
mailbox = 'vtk-users'
--account:create_mailbox(mailbox)
--account:subscribe_mailbox(mailbox)
results = account.INBOX:contain_to(addr) + account.INBOX:contain_cc(addr)
results:move_messages(account[mailbox])


-- Delete old DMI byvejr alerts --
results = account.INBOX:contain_subject('Byvejr: ') * account.INBOX:is_older(1)
results:delete_messages()

-- Scholar alerts --
results = account.INBOX:contain_from('scholaralerts-noreply@google.com')
results:move_messages(account['academic-alerts'])

