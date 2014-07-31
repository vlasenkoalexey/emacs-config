(add-to-list 'load-path "~/.emacs.d/")

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
(define-key my-key-map (kbd "M-u") 'backward-word)
(define-key my-key-map (kbd "M-o") 'forward-word)

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
(define-key my-key-map (kbd "M-;") 'isearch-forward)
(define-key my-key-map (kbd "M-:") 'isearch-backward)

(define-key my-key-map (kbd "M-p") 'recenter-top-bottom)

;;; STANDARD SHORTCUTS

(define-key my-key-map (kbd "C-n") 'new-empty-buffer)
(define-key my-key-map (kbd "C-S-n") 'make-frame-command)
(define-key my-key-map (kbd "C-o") 'find-file)
(define-key my-key-map (kbd "C-S-o") 'open-in-desktop)
(define-key my-key-map (kbd "C-S-t") 'open-last-closed)
(define-key my-key-map (kbd "C-w") 'close-current-buffer)
(define-key my-key-map (kbd "C-s") 'save-buffer)
(define-key my-key-map (kbd "C-S-s") 'write-file)
(define-key my-key-map (kbd "C-p") 'print-buffer-confirm)
(define-key my-key-map (kbd "C-a") 'mark-whole-buffer)
(define-key my-key-map (kbd "C-S-w") 'delete-frame)

(define-key my-key-map (kbd "C-f") 'search-forward)

(define-key my-key-map (kbd "<delete>") 'delete-char) ; the Del key for forward delete. Needed if C-d is set to nil.

(define-key my-key-map (kbd "C-<prior>") 'previous-user-buffer)
(define-key my-key-map (kbd "C-<next>") 'next-user-buffer)

(define-key my-key-map (kbd "C-S-<prior>") 'previous-emacs-buffer)
(define-key my-key-map (kbd "C-S-<next>") 'next-emacs-buffer)

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

(defun reload-keybindings ()
  (interactive)
  (my-keybindings (current-global-map)))

(setq show-paren-delay 0)           ; how long to wait?
(show-paren-mode t)                 ; turn paren-mode on
(setq show-paren-style 'expression) ; alternatives are 'parenthesis' and 'mixed'

(menu-bar-mode -1)
(tool-bar-mode -1)

;; (toggle-truncate-lines)

;;https://dea.googlecode.com/svn/trunk/my-lisps/linum+.el
(require 'linum+)
(setq linum-format "%d ")
(global-linum-mode 1)


;; built-in - file opening
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;; built-in - buffer list - not necessary
(setq bs-configurations
      '(("files" "^\\*scratch\\*" nil nil bs-visits-non-file bs-sort-buffer-interns-are-last)))

;; http://www.emacswiki.org/emacs/AutoComplete
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/dict")


;; Sr Speedbar
(require 'sr-speedbar)
(setq speedbar-show-unknown-files t)


;; Color theme
(add-to-list 'load-path "~/.emacs.d/color-theme/")
(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)

(color-theme-classic)

;; Font
(add-to-list 'default-frame-alist '(font . "Monospace-10"))
(set-default-font "Monospace-10")
