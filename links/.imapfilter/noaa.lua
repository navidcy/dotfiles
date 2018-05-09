-- see `man imapfilter_config` for info on options

-- function to strip trailing newlines piped from ~/.mutt/offlineimap.py
function trim(s)
    return (s:gsub("^%s*(.-)%s*$", "%1"))
end

status, pass = pipe_from("python ~/.mutt/offlineimap-password-store.py anders.damsgaard@noaa.gov")
account = IMAP {
    server = 'imap.gmail.com',
    username = 'anders.damsgaard@noaa.gov',
    password = trim(pass),
    ssl = 'tls1'
}

-- Mark AOS emails as seen in NOAA account
results = account.INBOX:is_unseen():match_to("oar.gfdl.forrestal@noaa.gov")
results:mark_seen()

results = account.INBOX:is_unseen():match_to("oar.gfdl.public_events@noaa.gov")
results:mark_seen()
