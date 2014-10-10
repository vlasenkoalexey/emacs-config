;; Turn on font-lock mode
(global-font-lock-mode t)

(require 'clojure-mode)
(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

(show-paren-mode 1)
(setq show-paren-delay 0)

;; Show line of matching paren
(defadvice show-paren-function
  (after show-matching-paren-offscreen activate)
  "If the matching paren is offscreen, show the matching line in the
        echo area. Has no effect if the character before point is not of
        the syntax class ')'."
  (interactive)
  (if (not (minibuffer-prompt))
      (let ((matching-text nil))
        ;; Only call `blink-matching-open' if the character before point
        ;; is a close parentheses type character. Otherwise, there's not
        ;; really any point, and `blink-matching-open' would just echo
        ;; "Mismatched parentheses", which gets really annoying.
        (if (char-equal (char-syntax (char-before (point))) ?\))
            (setq matching-text (blink-matching-open)))
        (if (not (null matching-text))
            (message matching-text)))))

(setq auto-mode-alist
      (nconc
       (list
        (cons "\\.data_tree_templates$" 'aqua-mode)
        (cons "\\.examples$" 'aqua-mode)
        (cons "\\.grammar$" 'aqua-mode)
        )
       auto-mode-alist))

;; command to comment/uncomment text
(defun aqua-comment-dwim (arg)
  "Comment or uncomment current line or region in a smart way.
For detail, see `comment-dwim'."
  (interactive "*P")
  (require 'newcomment)
  (let (
        (comment-start "#") (comment-end "")
        )
    (comment-dwim arg)))

;; define several class of keywords
(setq aqua-keywords '("with" "in" "rule" "config" "annotator" "feature_extractor"
                      "tokenizer" "type" "export" "subgrammar_users"
                      "interpretation_filter" "subgrammar"
		      "manual_override" "induced_rule" "manual_rule" "annotator_rule"
		      "optional" "examples" "statistics" "preference"
		      "define_semantic_fn" "define_annotator" "define_subgrammar"
		      "source" "provenance" "example" "instance") )
(setq aqua-constants '("true" "false"))
(setq aqua-events '("none"))

;; create the regex string for each class of keywords
(setq aqua-keywords-regexp (regexp-opt aqua-keywords 'words))
(setq aqua-constant-regexp (regexp-opt aqua-constants 'words))
(setq aqua-event-regexp (regexp-opt aqua-events 'words))

;; create the list for font-lock.
;; each class of keyword is given a particular face
(setq aqua-font-lock-keywords
  `(
    (,aqua-constant-regexp . font-lock-constant-face)
    (,aqua-event-regexp . font-lock-builtin-face)
    (,aqua-keywords-regexp . font-lock-keyword-face)
))

;; syntax table
(defvar aqua-syntax-table nil "Syntax table for `aqua-mode'.")
(setq aqua-syntax-table
      (let ((synTable (make-syntax-table)))
        (modify-syntax-entry ?# "< b" synTable)
        (modify-syntax-entry ?\n "> b" synTable)
        synTable))

;; define the major mode.
(define-derived-mode aqua-mode clojure-mode
  "aqua-mode is a major mode for editing aqua stuff."
  :syntax-table aqua-syntax-table

  (setq font-lock-defaults '(aqua-font-lock-keywords))
  (setq mode-name "aqua")

  ;; modify the keymap
  (define-key aqua-mode-map [remap comment-dwim] 'aqua-comment-dwim)
)

(font-lock-add-keywords 'aqua-mode '(("\\(\\$[-_A-Za-z0-9:]+\\)"
                                      1 font-lock-type-face)))


(font-lock-add-keywords 'aqua-mode '(("\\(domain=.*:language=.*\\)"
                                      1 font-lock-string-face)))

(font-lock-add-keywords 'aqua-mode '(("\\(domain=.*:language=.*\\))"
                                      1 font-lock-string-face)))
