;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "David Nowotny"
      user-mail-address "dycide@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

(setq doom-font (font-spec :family "fira code" :size 18))
(if IS-MAC
(custom-set-variables
'(irony-additional-clang-options
'("-I/Library/Developer/CommandLineTools/usr/include/c++/v1"))))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-Iosvkem)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)
;; (setq display-line-numbers 'relative)
;; Custom org mode config
(add-hook 'org-agenda-mode-hook '(lambda () (hl-line-mode 1)))

(after! org
  (setq org-agenda-span (quote week))
  (setq org-agenda-window-setup (quote other-window))
  (setq org-agenda-show-future-repeats nil)
  (setq org-deadline-warning-days 14)
  (setq org-startup-folded t)
  (setq org-ellipsis " >")
  (setq org-agenda-start-on-weekday 1)
  (setq calendar-week-start-day 1))

(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

;; (setenv "SHELL" "/opt/homebrew/bin/fish")
;; (setq-default vterm-shell "/opt/homebrew/bin/fish")
;; (setq-default explicit-shell-file-name "/opt/homebrew/bin/fish")
;; (when (memq window-system '(mac ns x))
;;   (exec-path-from-shell-initialize))
;; Real auto save config
;; only work in org
(require 'real-auto-save)
(add-hook 'org-mode-hook 'real-auto-save-mode)
(setq real-auto-save-interval 5) ;; in seconds

;;(setq c-default-style (cons '(c-mode . "cc-mode") c-default-style))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;;  To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; (use-package mu4e
;;   :ensure nil
;;   :load-path "/usr/share/emacs/site-lisp/mu4e/"
;;   :config
;;
;;   (setq mu4e-change-filenames-when-moving t)
;;
;;   (setq mu4e-update-interval (* 10 60))
;;   (setq mu4e-get-mail-command "mbsync -a")
;;   (setq mu4e-root-maildir "~/Mail")
;;
;;   (setq mu4e-drafts-folder      "/[Gmail]/Drafts")
;;   (setq mu4e-sent-folder        "/[Gmail]/Sent Mail")
;;   (setq mu4e-refile-folder      "/[Gmail]/All Mail")
;;   (setq mu4e-trash-folder       "/[Gmail]/Trash")
;;
;;   (setq mu4e-maildir-shortcuts
;;         '(("/Inbox"                     . ?i)
;;           ("/[Gmail]/Sent Mail"         . ?s)
;;           ("/[Gmail]/Trash"             . ?t)
;;           ("/[Gmail]/Drafts"            . ?d)
;;           ("/[Gmail]/All Mail"          . ?a))))

;; (use-package dirvish
;;   :init
;;   (dirvish-override-dired-mode)
;;   :custom
;;   (dirvish-quick-access-entries ; It's a custom option, `setq' won't work
;;    '(("h" "~/"                          "Home")
;;      ("d" "~/Downloads/"                "Downloads")
;;      ("m" "/mnt/"                       "Drives")
;;      ("t" "~/.local/share/Trash/files/" "TrashCan")))
;;   :config
;;   ;; (dirvish-peek-mode) ; Preview files in minibuffer
;;   ;; (dirvish-side-follow-mode) ; similar to `treemacs-follow-mode'
;;   (setq dirvish-mode-line-format
;;         '(:left (sort symlink) :right (omit yank index)))
;;   (setq dirvish-attributes
;;         '(all-the-icons file-time file-size collapse subtree-state vc-state git-msg))
;;   (setq delete-by-moving-to-trash t)
;;   (setq dired-listing-switches
;;         "-l --almost-all --human-readable --group-directories-first --no-group")
;;   :bind ; Bind `dirvish|dirvish-side|dirvish-dwim' as you see fit
;;   (("C-c f" . dirvish-side)
;;    :map dirvish-mode-map ; Dirvish inherits `dired-mode-map'
;;    ("a"   . dirvish-quick-access)
;;    ("f"   . dirvish-file-info-menu)
;;    ("y"   . dirvish-yank-menu)
;;    ("N"   . dirvish-narrow)
;;    ("^"   . dirvish-history-last)
;;    ("h"   . dirvish-history-jump) ; remapped `describe-mode'
;;    ("s"   . dirvish-quicksort)    ; remapped `dired-sort-toggle-or-edit'
;;    ("v"   . dirvish-vc-menu)      ; remapped `dired-view-file'
;;    ("TAB" . dirvish-subtree-toggle)
;;    ("M-f" . dirvish-history-go-forward)
;;    ("M-b" . dirvish-history-go-backward)
;;    ("M-l" . dirvish-ls-switches-menu)
;;    ("M-m" . dirvish-mark-menu)
;;    ("M-t" . dirvish-layout-toggle)
;;    ("M-s" . dirvish-setup-menu)
;;    ("M-e" . dirvish-emerge-menu)
;;    ("M-j" . dirvish-fd-jump)))

(use-package lsp-mode
  :ensure t
  :hook  ((c-mode . lsp)
	  (c++-mode . lsp)
	  (zig-mode . lsp)
	  (python-mode . lsp)
	  (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :config
  (setq lsp-keymap-prefix "C-c l")
  (define-key lsp-mode-map (kbd "C-c l") lsp-command-map)
  (setq lsp-file-watch-threshold 15000))

(use-package lsp-ui
  :ensure t
  :commands (lsp-ui-mode)
  :config
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-doc-delay 0.1)
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references))

(use-package lsp-ivy
  :ensure t
  :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)

(use-package! zig-mode
  :hook ((zig-mode . lsp-deferred))
  :custom (zig-format-on-save nil)
  :config
  (after! lsp-mode
    (add-to-list 'lsp-language-id-configuration '(zig-mode . "zig"))
    (lsp-register-client
      (make-lsp-client
        :new-connection (lsp-stdio-connection "~/dev/thirdparty/zls/zig-out/bin/zls")
        :major-modes '(zig-mode)
        :server-id 'zls))))

(use-package dap-mode
  :ensure t
  :defer t)

(require 'dap-lldb)
(require 'dap-cpptools)
(require 'dap-python)
(setq dap-python-debugger 'debugpy)

(dap-mode 1)

;; The modes below are optional

(dap-ui-mode 1)
;; enables mouse hover support
(dap-tooltip-mode 1)
;; use tooltips for mouse hover
;; if it is not enabled `dap-mode' will use the minibuffer.
(tooltip-mode 1)
;; displays floating panel with debug buttons
;; requies emacs 26+
(dap-ui-controls-mode 1)
(dap-register-debug-template "My App"
  (list :type "python"
        :args "-i"
        :cwd nil
        :env '(("DEBUG" . "1"))
        :target-module (expand-file-name "~/src/myapp/.env/bin/myapp")
        :request "launch"
        :name "My App"))

(setq python-shell-interpreter "python3")
(setq dap-python-executable "python3")
(setq dap-python-debugger 'debugpy)
