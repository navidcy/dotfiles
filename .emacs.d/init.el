;; emacs kicker --- kick start emacs setup
;; Copyright (C) 2010 Dimitri Fontaine
;;
;; Author: Dimitri Fontaine <dim@tapoueh.org>
;; URL: https://github.com/dimitri/emacs-kicker
;; Created: 2011-04-15
;; Keywords: emacs setup el-get kick-start starter-kit
;; Licence: WTFPL, grab your copy here: http://sam.zoy.org/wtfpl/
;;
;; This file is NOT part of GNU Emacs.

(require 'cl) ;common lisp goodies, loop

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
    "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
    (lambda (s)
      (end-of-buffer)
      (eval-print-last-sexp))))

;; now either el-get is `require'd already, or have been `load'ed by the
;; el-get installer.

;; set local recipes

;; now set our own packages
(setq
  my:el-get-packages
  '(el-get                  ; el-get is self-hosting
     evil                   ; extensible vi layer
     evil-leader            ; add <leader> shortcuts
     evil-surround          ; like Tim Pope's surround plugin
     helm                   ; Emacs incremental and narrowing framework
     popup                  ; visual popup interface library
     doxymacs               ; doxygen integration
     powerline              ; powerline for emacs
     rainbow-delimiters     ; color nested parantheses
     magit                  ; emacs mode for git
     markdown-mode          ; emacs mode for markdown
     org-mode               ; emacs mode for org
     flycheck               ; on the fly syntax check
     auto-complete          ; complete as you type with overlays
     auto-complete-c-headers; complete as you type with overlays
     zencoding-mode         ; http://www.emacswiki.org/emacs/ZenCoding
     color-theme            ; nice looking emacs
     color-theme-solarized)) ; check out color-theme-solarized

;;
;; Some recipes require extra tools to be installed
;;
;; Note: el-get-install requires git, so we know we have at least that.
;;
;(when (el-get-executable-find "cvs")
  ;(add-to-list 'my:el-get-packages 'emacs-goodies-el)) ; the debian addons for emacs

(when (el-get-executable-find "svn")
  (loop for p in '(psvn    		; M-x svn-status
                    yasnippet		; powerful snippet mode
                    )
        do (add-to-list 'my:el-get-packages p)))

(setq my:el-get-packages
      (append
        my:el-get-packages
        (loop for src in el-get-sources collect (el-get-source-name src))))

;; install new packages and init already installed packages
(el-get 'sync my:el-get-packages)

;; color theme
(load-theme 'solarized-dark t)

;; customized Vim-like behavior
(require 'evil)
(evil-mode 1)
(require 'powerline)
(powerline-default-theme)
;(powerline-vim-theme)
(setq powerline-color1 "#073642")
(setq powerline-color2 "#002b36")
(set-face-attribute 'mode-line nil
                    :foreground "#fdf6e3"
                    :background "#2aa198"
                    :inverse-video nil
                    :box nil)
(set-face-attribute 'mode-line-inactive nil
                    :inverse-video nil
                    :box nil)

;; on to the visual settings
(setq inhibit-splash-screen t)  ; no splash screen, thanks
(line-number-mode 1)            ; have line numbers and
(column-number-mode 1)          ; column numbers in the mode line

(tool-bar-mode -1)              ; no tool bar with icons
(scroll-bar-mode -1)            ; no scroll bars
(unless (string-match "apple-darwin" system-configuration)
  ;; on mac, there's always a menu bar drown, don't have it empty
  (menu-bar-mode -1))

;; choose your own fonts, in a system dependant way
(if (string-match "apple-darwin" system-configuration)
  (set-face-font 'default "Monaco-13")      ; os x
  (set-face-font 'default "termsynu"))      ; other
  ;(set-face-font 'default "Monospace-10"))

(global-hl-line-mode)   ; highlight current line
(global-linum-mode 1)   ; add line numbers on the left

;; add org shortcuts
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)      ; open agenda
(setq org-log-done t)
(setq org-agenda-files (list "~/owncloud/todo.org"
                             ;"another file"
                             ))

;; control which languages are enabled for execution in org-mode with C-c C-c
;; see http://orgmode.org/org.html#Languages
(require 'ob-C)
(require 'ob-gnuplot)
(require 'ob-octave)
(require 'ob-latex)
(require 'ob-python)
(require 'ob-sh)

;; avoid compiz manager rendering bugs
(add-to-list 'default-frame-alist '(alpha . 100))

;; copy/paste with C-c and C-v and C-x, check out C-RET too
(cua-mode)

;; under mac, have Command as Meta and keep Option for localized input
(when (string-match "apple-darwin" system-configuration)
  (setq mac-allow-anti-aliasing t)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'none))

;; Use the clipboard, pretty please, so that copy/paste "works"
(setq x-select-enable-clipboard t)

;; Navigate windows with M-<arrows>
(windmove-default-keybindings 'meta)
(setq windmove-wrap-around t)

; winner-mode provides C-<left> to get back to previous window layout
(winner-mode 1)

;; whenever an external process changes a file underneath emacs, and there
;; was no unsaved changes in the corresponding buffer, just revert its
;; content to reflect what's on-disk.
(global-auto-revert-mode 1)

;; Syntax rules
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq c-default-style "linux" c-basic-offset 4)

;; Setup modes for files
(setq auto-mode-alist
      (append
        '(("\\.c" . c-mode)
          ("\\.cpp" . c-mode)
          ("\\.h" . c-mode)
          ("\\.cuh" . cuda-mode)
          ("\\.cu" . cuda-mode)
          ("\\.m" . matlab-mode))
        auto-mode-alist)
      )

;; y or n instead of yes or no
(defalias 'yes-or-no-p 'y-or-n-p)


;; mail client setup
(require 'mu4e)
(require 'smtpmail)

;; main account
(setq mu4e-maildir (expand-file-name "~/Mail"))
(setq mu4e-sent-folder "/riseup/Sent Items"
      mu4e-drafts-folder "/riseup/Drafts"
      mu4e-trash-folder "/riseup/Trash"
      user-mail-address "andersd@riseup.net"
      message-signature=file "~/.signature"
      smtpmail-default-smtp-server "mail.riseup.net"
      smtpmail-local-domain "riseup.net"
      smtpmail-smtp-server "mail.riseup.net"
      ;smtpmail-stream-type starttls
      smtpmail-smtp-service 587)

(defvar my-mu4e-account-alist
  '(("riseup"
     (mu4e-sent-folder "/riseup/Sent Items")
     (mu4e-drafts-folder "/riseup/Drafts")
     (mu4e-trash-folder "/riseup/Trash")
     (user-mail-address "andersd@riseup.net")
     (message-signature-file "~/.signature")
     (smtpmail-default-smtp-server "mail.riseup.net")
     (smtpmail-local-domain "riseup.net")
     (smtpmail-smtp-server "mail.riseup.net")
     ;(smtpmail-stream-type starttls)
     (smtpmail-smtp-service 587))
    ("geomail"
     (mu4e-sent-folder "/geomail/Sent Items")
     (mu4e-drafts-folder "/geomail/Drafts")
     (mu4e-trash-folder "/geomail/Trash")
     (user-mail-address "anders.damsgaard@geo.au.dk")
     (message-signature-file "~/.signature")
     (smtpmail-default-smtp-server "asmtp.au.dk")
     (smtpmail-local-domain "au.dk")
     (smtpmail-smtp-server "asmtp.au.dk")
     ;(smtpmail-stream-type starttls)
     (smtpmail-smtp-service 587))))

;; don't save message to Sent Messages, GMail/IMAP will take care of this
;(setq mu4e-sent-messages-behavior 'delete)

;; setup some handy shortcuts
(setq mu4e-maildir-shortcuts
      '(("/riseup/INBOX" . ?i)
        ("/geomail/INBOX" . ?g)
        ("/riseup/Sent Items" . ?s)
        ("/riseup/Trash" . ?t)))

;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap")

;; enable inline images
(setq mu4e-view-show-images t)
;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(send-mail-function (quote smtpmail-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
