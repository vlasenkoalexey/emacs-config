
(add-to-list 'load-path "~/.emacs.d/lisp")

(setq make-backup-files         nil) ; Don't want any backup files
(setq auto-save-list-file-name  nil) ; Don't want any .saves files
(setq auto-save-default         nil) ; Don't want any auto saving

;;(add-to-list 'load-path "~/.emacs.d/ergoemacs-mode")
;;(require 'ergoemacs-mode)

;;(setq ergoemacs-theme nil) ;; Uses Standard Ergoemacs keyboard theme
;;(setq ergoemacs-keyboard-layout "us") ;; Assumes QWERTY keyboard layout
;;(ergoemacs-mode 0)

(defun new-empty-buffer ()
  "Open a new empty buffer."
  (interactive)
  (let ((buf (generate-new-buffer "untitled")))
    (switch-to-buffer buf)
    (funcall (and initial-major-mode))
    (setq buffer-offer-save t)))

;;(global-unset-key (kbd "C-s"))
(global-unset-key (kbd "C-l"))

;(setq tab-always-indent 'complte)
;(add-to-list 'completion-styles 'initials t)

;;(require 'misc)

(defun my-keybindings (my-key-map)
  ;; Bushenko
  
;;  (define-key my-key-map (kbd "C-SPC") 'set-mark-command)
;;  (define-key my-key-map (kbd "M-SPC") 'set-mark-command)
  (define-key my-key-map (kbd "C-M-SPC") 'set-mark-command)
  (define-key my-key-map (kbd "C-l") 'goto-line)
;;  (define-key my-key-map (kbd "C-M-P") 'my-close-tag)
;;  (define-key my-key-map (kbd "C-p") 'company-complete)
;;  (define-key my-key-map (kbd "C-(") 'my-shrink-vert)
;;  (define-key my-key-map (kbd "C-)") 'my-enlarge-vert)
;;  (define-key my-key-map (kbd "C-9") 'my-shrink-horz)
;;  (define-key my-key-map (kbd "C-0") 'my-enlarge-horz)
;;  (define-key my-key-map (kbd "M-(") 'my-super-shrink-vert)
;;  (define-key my-key-map (kbd "M-)") 'my-super-enlarge-vert)
;;  (define-key my-key-map (kbd "M-9") 'my-super-shrink-horz)
;;  (define-key my-key-map (kbd "M-0") 'my-super-enlarge-horz)
;;  (define-key my-key-map (kbd "M-8") 'my-50%-horz)
;;  (define-key my-key-map (kbd "<f8>") 'my-format)
;;  (define-key my-key-map (kbd "M-c") 'my-kill-ring-save)
  (define-key my-key-map (kbd "C-c l") 'toggle-truncate-lines)
;;  (define-key my-key-map (kbd "M-a") 'mark-whole-buffer)
;;  (define-key my-key-map (kbd "M-n") 'reindent-then-newline-and-indent)
;;  (define-key my-key-map (kbd "M-m") 'reindent-then-newline-and-indent)
;;  (define-key my-key-map (kbd "<S-M-left>") 'windmove-left)
;;  (define-key my-key-map (kbd "<S-M-down>") 'windmove-down)
;;  (define-key my-key-map (kbd "<S-M-right>") 'windmove-right)
;;  (define-key my-key-map (kbd "<S-M-up>") 'windmove-up)
;;  (define-key my-key-map (kbd "S-M-j") 'windmove-left)
;;  (define-key my-key-map (kbd "S-M-k") 'windmove-down)
;;  (define-key my-key-map (kbd "S-M-l") 'windmove-right)
;;  (define-key my-key-map (kbd "S-M-i") 'windmove-up)
;;  (define-key my-key-map (kbd "C-b") 'bookmark-set)
;;  (define-key my-key-map (kbd "M-b") 'bookmark-jump)
;;  (define-key my-key-map (kbd "<f4>") 'bookmark-bmenu-list)
;;  (define-key my-key-map (kbd "C-M-.") 'pop-tag-mark)
;;  (define-key my-key-map (kbd "C-t") 'indent-for-tab-command)
  (define-key my-key-map (kbd "C-x C-s") 'save-buffer)
  (define-key my-key-map (kbd "M-s") 'save-buffer)
;;  (define-key my-key-map (kbd "C-,") 'repeat)
  (define-key my-key-map (kbd "<f2>") 'bs-show)
;;  (define-key my-key-map (kbd "<f3>") 'visit-tags-table)
  (define-key my-key-map (kbd "<f12>") 'sr-speedbar-toggle)
;;  (define-key my-key-map (kbd "<f9>") 'upcase-region)
;;  (define-key my-key-map (kbd "M-q") 'move-cursor-next-pane)
  ;;  (define-key my-key-map (kbd "<f11>") 'show-my-help)

  ;; ErgoEmacs

;; Single char cursor movement
(define-key my-key-map (kbd "M-j") 'backward-char)
(define-key my-key-map (kbd "M-l") 'forward-char)
(define-key my-key-map (kbd "M-i") 'previous-line)
(define-key my-key-map (kbd "M-k") 'next-line)

;; Move by word
;;(define-key my-key-map (kbd "M-u") 'backward-word)
;;(define-key my-key-map (kbd "M-o") 'forward-word)
(define-key my-key-map (kbd "M-u") (lambda () (interactive)
                              (forward-same-syntax -1)))
(define-key my-key-map (kbd "M-o") 'forward-same-syntax)


;; Move by paragraph
;;(define-key my-key-map (kbd "M-U") 'backward-paragraph)
;;(define-key my-key-map (kbd "M-O") 'forward-paragraph)

;; Move to beginning/ending of line
;;(define-key my-key-map (kbd "M-H") 'move-beginning-of-line)
;;(define-key my-key-map (kbd "M-h") 'move-end-of-line)
(define-key my-key-map (kbd "M-U") 'move-beginning-of-line)
(define-key my-key-map (kbd "M-O") 'move-end-of-line)

;; Move by screen (page up/down)
;;(define-key my-key-map (kbd "M-I") 'scroll-down)
;;(define-key my-key-map (kbd "M-K") 'scroll-up)

;; Move to beginning/ending of file
;;(define-key my-key-map (kbd "M-J") 'beginning-of-buffer)
;;(define-key my-key-map (kbd "M-L") 'end-of-buffer)

;; isearch
(define-key my-key-map (kbd "C-f") 'isearch-forward)
;;(define-key my-key-map (kbd "M-;") 'isearch-forward)
;;(define-key my-key-map (kbd "M-:") 'isearch-backward)

(define-key my-key-map (kbd "M-p") 'recenter-top-bottom)
;;(define-key my-key-map (kbd "C-f") 'search-forward)


;;; STANDARD SHORTCUTS

(define-key my-key-map (kbd "C-n") 'new-empty-buffer)
(define-key my-key-map (kbd "C-S-n") 'make-frame-command)
(define-key my-key-map (kbd "C-o") 'find-file)
(define-key my-key-map (kbd "C-S-o") 'open-in-desktop)
(define-key my-key-map (kbd "C-S-t") 'open-last-closed)
;;(define-key my-key-map (kbd "C-w") 'close-current-buffer)
(define-key my-key-map (kbd "C-s") 'save-buffer)
(define-key my-key-map (kbd "C-S-s") 'write-file)
(define-key my-key-map (kbd "C-p") 'print-buffer-confirm)
(define-key my-key-map (kbd "C-a") 'mark-whole-buffer)
(define-key my-key-map (kbd "C-S-w") 'delete-frame)

(define-key my-key-map (kbd "<delete>") 'delete-char) ; the Del key for forward delete. Needed if C-d is set to nil.

(define-key my-key-map (kbd "C-<prior>") 'previous-buffer)
(define-key my-key-map (kbd "C-<next>") 'next-buffer)

(define-key my-key-map (kbd "M-S-<prior>") 'backward-page)
(define-key my-key-map (kbd "M-S-<next>") 'forward-page)

(define-key my-key-map (kbd "C-x C-b") 'ibuffer)
(define-key my-key-map (kbd "C-h m") 'describe-major-mode)
(define-key my-key-map (kbd "C-h o") 'where-is-old-binding)

(define-key my-key-map (kbd "M-'") 'comment-dwim)

;; My bindings
(define-key my-key-map (kbd "C-<tab>") 'other-window)
(define-key my-key-map [C-S-iso-lefttab] 'next-buffer)

)

(my-keybindings (current-global-map))
(message "init.el reloaded")

(cua-mode 1)

;; (global-set-key (kbd "C-S-v") '(lambda ()
;;     (interactive) (popup-menu 'yank-menu)))

(global-set-key (kbd "C-S-v")
                '(lambda ()
                   (interactive)
                   (if (not (eq last-command 'yank))
                       (yank) (yank-pop))))

(define-key isearch-mode-map (kbd "C-f") 'isearch-repeat-forward) ; repeat isearch forward
(define-key isearch-mode-map (kbd "C-S-f") 'isearch-repeat-backward) ; repeat isearch backward
(define-key isearch-mode-map (kbd "C-v") 'isearch-yank-kill) ; normal past in minibuffer

(defun forward-word-in-line (n)
  "Like `forward-word', but restricted to moving within a single line."
  (interactive "p")
  (save-restriction
    (narrow-to-region (line-beginning-position) (line-end-position))
    (forward-word n)))

(defun backward-word-in-line (n)
  "Like `backward-word', but restricted to moving within a single line."
  (interactive "p")
  (forward-word-in-line (if (zerop n) -1 (- n))))

(defun forward-word-or-line ()
  "Move forward one word, like `forward-word' without argument,
but if point is at end of line, just move to the beginning of the
next line instead."
  (interactive "^")
  (let ((bound (line-end-position)))
    (forward-word)
    (if (> (point) bound)
        (goto-char (1+ bound)))))


(defun backward-word-or-line ()
  "Move backward one word, like `backward-word' without argument,
but if point is at beginning of line, just move to the end of the
previous line instead."
  (interactive "^")
  (let ((bound (line-beginning-position)))
    (backward-word)
    (if (< (point) bound)
        (goto-char (1- bound)))))


(global-unset-key (kbd "C-<right>"))
(global-unset-key (kbd "C-<left>"))
(global-set-key (kbd "C-<right>") 'forward-word-or-line)
(global-set-key (kbd "C-<left>") 'backward-word-or-line)
;;(global-set-key (kbd "C-<right>") 'forward-word)
;;(global-set-key (kbd "C-<left>") 'backward-word)
;;(global-set-key (kbd "C-<right>") 'forward-block)
;;(global-set-key (kbd "C-<left>") 'backward-block)
;; Selection doesn't work with this:
;; (global-set-key (kbd "C-<left>") (lambda () (interactive)
;;                               (forward-same-syntax -1)))

(defun reload-keybindings ()
  (interactive)
  (my-keybindings (current-global-map)))

(setq show-paren-delay 0)           ; how long to wait?
(show-paren-mode t)                 ; turn paren-mode on
(setq show-paren-style 'expression) ; alternatives are 'parenthesis' and 'mixed'

(menu-bar-mode -1)
(tool-bar-mode -1)

(setq-default truncate-lines t)

(global-set-key (kbd "<mouse-3>") 'copy-region-as-kill)

(setq frame-title-format "%b")

;;https://dea.googlecode.com/svn/trunk/my-lisps/linum+.el
(require 'linum+)
(setq linum-format "%d ")
(global-linum-mode 1)
(column-number-mode 1)

;; built-in - file opening
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;; built-in - buffer list - not necessary
(setq bs-configurations
      '(("files" "^\\*scratch\\*" nil nil bs-visits-non-file bs-sort-buffer-interns-are-last)))

;; http://www.emacswiki.org/emacs/AutoComplete
(add-to-list 'load-path "~/.emacs.d/lisp/auto-complete")
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/auto-complete/dict")


;; Sr Speedbar
(require 'sr-speedbar)
(setq speedbar-show-unknown-files t)


;; Color theme
(add-to-list 'load-path "~/.emacs.d/lisp/color-theme/")
(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)

(color-theme-classic)

;; Font
(add-to-list 'default-frame-alist '(font . "Monospace-10"))
(set-default-font "Monospace-10")


;; Undo/Redo
(add-to-list 'load-path "~/.emacs.d/lisp/undo-tree")
(require 'undo-tree)
(global-undo-tree-mode 1)
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-z") 'undo) ; 【Ctrl+z】
(global-set-key (kbd "C-S-z") 'redo) ; 【Ctrl+Shift+z】;  Mac style


;; Shift the selected region right if distance is postive, left if
;; negative

(defun shift-region (distance)
 (let ((mark (mark)))
    (save-excursion
      (indent-rigidly (region-beginning) (region-end) distance)
      (push-mark mark t t)
      ;; Tell the command loop not to deactivate the mark
      ;; for transient mark mode
      (setq deactivate-mark nil))))

(defun shift-right ()
   (interactive)
   (shift-region 2))

(defun shift-left ()
  (interactive)
  (shift-region -2))

;; Bind (shift-right) and (shift-left) function to your favorite keys. I use
;; the following so that Ctrl-Shift-Right Arrow moves selected text one 
;; column to the right, Ctrl-Shift-Left Arrow moves selected text one
;; column to the left:

(global-set-key (kbd "<s-tab>") 'shift-right)
(global-set-key (kbd "<s-iso-lefttab>") 'shift-left)

;; use underscore as part of the word for C++, Java, and Python
(defun fix-syntax-tables()
  (interactive)
  (modify-syntax-entry ?_ "w" c++-mode-syntax-table)
  (modify-syntax-entry ?_ "w" java-mode-syntax-table)
  (modify-syntax-entry ?_ "w" python-mode-syntax-table))

 (add-hook 'c++-mode-hook (lambda () (modify-syntax-entry ?_ "w" c++-mode-syntax-table)))
 (add-hook 'java-mode-hook (lambda ()  (modify-syntax-entry ?_ "w" java-mode-syntax-table)))
(add-hook 'pythod-mode-hook (lambda () (modify-syntax-entry ?_ "w" python-mode-syntax-table)))

;; Select current word (not copying yet)
(defun mark-and-copy-current-word (&optional arg allow-extend)
    "Put point at beginning of current word, set mark at end."
    (interactive "p\np")
    (setq arg (if arg arg 1))
    (if (and allow-extend
             (or (and (eq last-command this-command) (mark t))
                 (region-active-p)))
        (set-mark
         (save-excursion
           (when (< (mark) (point))
             (setq arg (- arg)))
           (goto-char (mark))
           (forward-word arg)
           (point)))
      (let ((wbounds (bounds-of-thing-at-point 'word)))
        (unless (consp wbounds)
          (error "No word at point"))
        (if (>= arg 0)
            (goto-char (car wbounds))
          (goto-char (cdr wbounds)))
        (push-mark (save-excursion
                     (forward-word arg)
                     (point)))
        (activate-mark)
;;        (copy-region-as-kill (region-beginning) (region-end))
;;        (activate-mark)
        )))

(setq cua-keep-region-after-copy t)
(global-set-key (kbd "C-w") 'mark-and-copy-current-word)

;; Shell-pop
(require 'shell-pop)


;; ansi-term
;; (defun paste1 ()
;;    (interactive)
;;   (if (eq major-mode 'term-mode)
;;       (message "term")
;;       (message "not term")
;;       )
;;   )
;; (global-set-key (kbd "C-0") 'paste1)
(add-hook 'term-mode-hook
          (function
           (lambda ()
             (define-key term-raw-map (kbd "C-y")
               (lambda ()
                 (interactive)
                 (term-send-raw-string (current-kill 0))))
             (define-key term-raw-map (kbd "C-v")
               (lambda ()
                 (interactive)
                 (term-send-raw-string (current-kill 0))))
             (define-key term-raw-map (kbd "M-x") 'nil)
             )))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;'(shell-pop-default-directory "/Users/kyagi/git")
 '(shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
 '(shell-pop-term-shell "/bin/bash")
 '(shell-pop-universal-key "C-t")
 '(shell-pop-window-height 30)
 '(shell-pop-full-span t)
 '(shell-pop-window-position "bottom"))

;; TabBar - not useful
;; (require 'tabbar)
;; (tabbar-mode)

(require 'goto-chg)
(global-set-key (kbd "C-`") 'goto-last-change)
;;(global-set-key [(control ?,)] 'goto-last-change-reverse)

;; Google stuff

(load-file "/google/src/head/depot/eng/elisp/google.el")
(require 'p4-google)                ;; g4-annotate, improves find-file-at-point
(require 'compilation-colorization) ;; colorizes output of (i)grep
(require 'rotate-clients)           ;; google-rotate-client
(require 'rotate-among-files)       ;; google-rotate-among-files
(require 'googlemenu)               ;; handy Google menu bar
(require 'p4-files)                 ;; transparent support for Perforce filesystem
(require 'google3)                  ;; magically set paths for compiling google3 code
(require 'google3-build)            ;; support for blaze builds
(require 'csearch)                  ;; Search the whole Google code base.
(require 'google-go)

(defun font-lock-width-keyword (width)
  "Return a font-lock style keyword for a string beyond width WIDTH
that uses 'font-lock-warning-face'."
  `((,(format "^%s\\(.+\\)" (make-string width ?.))
     (1 font-lock-warning-face t))))

(font-lock-add-keywords 'c++-mode (font-lock-width-keyword 80))
(font-lock-add-keywords 'java-mode (font-lock-width-keyword 100))
(font-lock-add-keywords 'js-mode (font-lock-width-keyword 80))
(font-lock-add-keywords 'python-mode (font-lock-width-keyword 80))

;; Build and test
(global-set-key (kbd "M-g b") 'google3-build)
(global-set-key (kbd "C-x g b") 'google3-build)
(global-set-key (kbd "M-g t") 'google3-test)
(global-set-key (kbd "C-x g t") 'google3-test)

;; gtags
(global-set-key (kbd "<f3>") 'gtags-first-tag)
(global-set-key (kbd "C-<f3>") 'gtags-show-tag-locations)
(global-set-key (kbd "C-M-g") 'gtags-find-tag)
(global-set-key (kbd "s-SPC") 'gtags-complete-tag)

;; Autocomplte and syntax highlight
(require 'gcomplete)
(gcomplete-setup-flymake)
;; auto-complete if you want it as well
(gcomplete-setup-for-auto-complete)

(require 'aqua-mode)
