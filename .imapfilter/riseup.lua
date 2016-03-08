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

status, pass = pipe_from("python ~/.mutt/offlineimap.py andersd mail.riseup.net")
account = IMAP {
    server = 'mail.riseup.net',
    username = 'andersd',
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
--[[all = account.INBOX:select_all()
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
spam:move_messages(account['Junk'])
unsure:copy_messages(account['Junk/unsure'])
]] --


-- Debian announcements list --
addr = 'debian-announce@lists.debian.org'
mailbox = 'debian-announce'
--account:create_mailbox(mailbox)
--account:subscribe_mailbox(mailbox)
results = account.INBOX:contain_to(addr) + account.INBOX:contain_cc(addr)
results:move_messages(account[mailbox])

-- Debian laptop list --
addr = 'debian-laptop@lists.debian.org'
mailbox = 'debian-laptop'
--account:create_mailbox(mailbox)
--account:subscribe_mailbox(mailbox)
results = account.INBOX:contain_to(addr) + account.INBOX:contain_cc(addr)
results:move_messages(account[mailbox])

-- Debian news list --
addr = 'debian-news@lists.debian.org'
mailbox = 'debian-news'
--account:create_mailbox(mailbox)
--account:subscribe_mailbox(mailbox)
results = account.INBOX:contain_to(addr) + account.INBOX:contain_cc(addr)
results:move_messages(account[mailbox])

-- Debian photo list --
addr = 'debian-photo@lists.debian.org'
mailbox = 'debian-photo'
--account:create_mailbox(mailbox)
--account:subscribe_mailbox(mailbox)
results = account.INBOX:contain_to(addr) + account.INBOX:contain_cc(addr)
results:move_messages(account[mailbox])

-- Debian security list --
addr = 'debian-security-announce@lists.debian.org'
mailbox = 'debian-security-announce'
--account:create_mailbox(mailbox)
--account:subscribe_mailbox(mailbox)
results = account.INBOX:contain_to(addr) + account.INBOX:contain_cc(addr)
results:move_messages(account[mailbox])

-- Debian security list --
addr = 'debian-security@lists.debian.org'
mailbox = 'debian-security'
----account:create_mailbox(mailbox)
--account:subscribe_mailbox(mailbox)
results = account.INBOX:contain_to(addr) + account.INBOX:contain_cc(addr)
results:move_messages(account[mailbox])

-- Debian danish list --
addr = 'debian-user-danish@lists.debian.org'
mailbox = 'debian-user-danish'
--account:create_mailbox(mailbox)
--account:subscribe_mailbox(mailbox)
results = account.INBOX:contain_to(addr) + account.INBOX:contain_cc(addr)
results:move_messages(account[mailbox])

-- Debian security announcements list --
addr = 'debian-security-announce@lists.debian.org'
mailbox = 'debian-security'
--account:create_mailbox(mailbox)
--account:subscribe_mailbox(mailbox)
results = account.INBOX:contain_to(addr) + account.INBOX:contain_cc(addr)
results:move_messages(account[mailbox])

-- Debian testing security announcements list --
addr = 'debian-testing-security-announce@lists.debian.org'
mailbox = 'debian-security'
----account:create_mailbox(mailbox)
--account:subscribe_mailbox(mailbox)
results = account.INBOX:contain_to(addr) + account.INBOX:contain_cc(addr)
results:move_messages(account[mailbox])

-- Debian science list --
addr = 'debian-science@lists.debian.org'
mailbox = 'debian-science'
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


-- Delete old DMI byvejr alerts --
results = account.INBOX:contain_subject('Byvejr: ') * account.INBOX:is_older(1)
results:delete_messages()

-- Scholar alerts --
results = account.INBOX:contain_from('scholaralerts-noreply@google.com')
results:move_messages(account['academic-alerts'])

