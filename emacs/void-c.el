(defconst void-c-style
  '((c-backslash-column . 70)
    (c-basic-offset . 2)
    (c-comment-only-line-offset . 0)
    (c-hanging-braces-alist
     (block-open after)
     (block-close . c-snug-do-while)
     (brace-list-open after)
     (brace-entry-open after)
     (defun-open after)
     (defun-close before)
     (inexpr-class-open after)
     (inexpr-class-close before)
     (inline-open after)
     (inline-close before)
     (substatement-open after)
     (extern-lang-open after))
    (c-hanging-colons-alist
     (member-init-intro before))
    (c-hanging-comment-starter-p . t)
    (c-hanging-comment-ender-p . t)
    (c-offsets-alist
     (string . c-lineup-dont-change)
     (c . c-lineup-C-comments)
     (defun-open . 0)
     (defun-close . 0)
     (defun-block-intro . +)
     (inline-open . 0)
     (inline-close . 0)
     (extern-lang-open . 0)
     (extern-lang-close . 0)
     (func-decl-cont . ++)
     (topmost-intro . 0)
     (topmost-intro-cont . 0)
     (member-init-intro . ++)
     (member-init-cont . c-lineup-multi-inher)
     (inher-intro . 0)
     (inher-cont . c-lineup-multi-inher)
     (innamespace . 0)
     (block-open . 0)
     (block-close . 0)
     (brace-list-open . 0)
     (brace-list-close . 0)
     (brace-list-intro . +)
     (brace-list-entry . 0)
     (statement . 0)
     (statement-cont . (add c-lineup-assignments
                            c-lineup-cascaded-calls))
     (statement-block-intro . +)
     (statement-case-intro . +)
     (statement-case-open . 0)
     (substatement . +)
     (substatement-open . 0)
     (case-label . 0)
     (access-label . -)
     (label . 0)
     (do-while-closure . 0)
     (else-clause . 0)
     (comment-intro . c-lineup-comment)
     (arglist-intro . +)
     (arglist-cont . (add c-lineup-arglist
                          c-lineup-gcc-asm-reg))
     (arglist-cont-nonempty . (add c-lineup-arglist
                                   c-lineup-gcc-asm-reg))
     (arglist-close . c-lineup-close-paren)
     (stream-op . 0)
     (inextern-lang . 0)
     (cpp-macro . -)
     (cpp-define-intro . +)
     (cpp-macro-cont . 0)
     (inexpr-statement . 0)))
  "void Programming Style")

(font-lock-add-keywords 'c++-mode
  '(("\\<\\(constexpr\\|noexcept\\)\\>" . font-lock-keyword-face)))

(font-lock-add-keywords 'c++-mode
  '(("\\<\\(FIXME\\|TODO\\):" 1 font-lock-warning-face prepend)))

(c-add-style "void" void-c-style)

(add-hook 'c-common-mode-hook
          '(lambda ()
             ((c-set-style "void"))))

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))


(provide 'void-c)
