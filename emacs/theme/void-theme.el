(deftheme void "void theme")

(let ((background   "#1c1c1c")
      (text-color   "#eeeeee")
      (highlight    "#282828")
      (current-line "#282a2e")
      (selection    "#373b41")
      (comment      "#969896")
      (red          "#cc6666")
      (orange       "#de935f")
      (yellow       "#f0c674")
      (green        "#b5bd68")
      (aqua         "#8abeb7")
      (blue         "#81a2be")
      (purple       "#b294bb")

      ;; ediff colors
      (ediff-bg-current "#333333")
      (ediff-bg-even    "#222222")
      (ediff-bg-odd     "#222222")
      (ediff-bg-fine    "#003344")

      ;; mode-line colors
      (ml-bg         "#282828")
      (ml-bg-focus   "#373b41")
      (ml-text       "#888888")
      (ml-text-focus "#c5c8c6")
      (ml-border     "#111111"))

  (let ((bg-nil   '(:background nil))
        (fg-nil   '(:foreground nil))
        (u-nil    '(:underline nil))
        (w-normal '(:weight normal))

        (bg-default `(:background ,background))
        (fg-default `(:foreground ,text-color))
        (bg-current-line `(:background ,current-line))
        (bg-selection `(:background ,selection))
        (fg-selection `(:foreground ,selection))

        (bg-red    `(:background ,red))
        (bg-orange `(:background ,orange))
        (bg-yellow `(:background ,yellow))
        (bg-green  `(:background ,green))
        (bg-aqua   `(:background ,aqua))
        (bg-blue   `(:background ,blue))
        (bg-purple `(:background ,purple))

        (fg-red    `(:foreground ,red))
        (fg-orange `(:foreground ,orange))
        (fg-yellow `(:foreground ,yellow))
        (fg-green  `(:foreground ,green))
        (fg-aqua   `(:foreground ,aqua))
        (fg-blue   `(:foreground ,blue))
        (fg-purple `(:foreground ,purple))

        (fg-comment `(:foreground ,comment))

        (b '(:weight bold))
        (i '(:slant italic))
        (u '(:underline t))

        (warnline    '(:underline ,orange))
        (errline     '(:underline ,red))
        (inverse     '(:inverse-video t))
        (inverse-nil '(:inverse-video nil)))

    (custom-theme-set-variables
     'void
     `(fci-rule-color ,current-line)
     `(ansi-color-names-vector (vector ,text-color ,red ,green ,yellow ,blue ,purple ,aqua ,background))
     `(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
     `(foreground-color ,text-color)
     `(background-color ,background)
     '(background-mode 'dark))

    (custom-theme-set-faces
     'void

     `(default     ((t (,@fg-default ,@bg-default))))
     `(bold        ((t (,@b))))
     `(italic      ((t (,@i))))
     `(bold-italic ((t (,@b ,@i))))
     `(underline   ((t (,@u))))

     `(font-lock-builtin-face              ((t (,@fg-purple))))
     `(font-lock-comment-delimiter-face    ((t (,@fg-comment ,@i))))
     `(font-lock-comment-face              ((t (,@fg-comment ,@i))))
     `(font-lock-constant-face             ((t (,@fg-orange))))
     `(font-lock-doc-face                  ((t (,@fg-purple))))
     `(font-lock-doc-string-face           ((t (,@fg-yellow))))
     `(font-lock-function-name-face        ((t (,@fg-blue))))
     `(font-lock-keyword-face              ((t (,@fg-green))))
     `(font-lock-negation-char-face        ((t (,@fg-green))))
     `(font-lock-preprocessor-face         ((t (,@fg-purple))))
     `(font-lock-regexp-grouping-backslash ((t (,@fg-yellow))))
     `(font-lock-regexp-grouping-construct ((t (,@fg-purple))))
     `(font-lock-string-face               ((t (,@fg-aqua))))
     `(font-lock-type-face                 ((t (,@fg-orange))))
     `(font-lock-variable-name-face        ((t (,@fg-yellow))))
     `(font-lock-warning-face              ((t (,@fg-red ,@b))))

     `(shadow  ((t (,fg-comment))))
     `(success ((t (,fg-green))))
     `(error   ((t (,fg-red))))
     `(warning ((t (,fg-orange))))

     ;; flymake
     `(flymake-warnline ((,t (,@warnline))))
     `(flymake-errline ((,t (,@errline))))

     ;; search
     `(match                       ((t (,@fg-blue   ,@bg-default ,@inverse))))
     `(isearch                     ((t (,@fg-yellow ,@bg-default ,@inverse))))
     `(isearch-lazy-highlight-face ((t (,@fg-aqua   ,@bg-default ,@inverse))))
     `(isearch-fail                ((t (,@fg-red    ,@bg-default ,@inverse))))

     ;; ido
     `(ido-subdir      ((t (,@fg-purple))))
     `(ido-first-match ((t (,@fg-orange))))
     `(ido-only-match  ((t (,@fg-green))))
     `(ido-indicator   ((t (,@fg-red ,@bg-default))))
     `(ido-virtual     ((t (,@fg-comment))))


     ;; ui
     `(cursor ((t (,@bg-red))))
     `(fringe ((t (,@bg-current-line))))
     `(linum ((t (,@bg-current-line))))
     `(border ((t (,@bg-current-line))))
     `(border-glyph ((t (nil))))
     `(vertical-border ((t (,@fg-selection))))
     `(escape-glyph-face ((t (,@fg-red))))

     `(highlight ((t (,@inverse-nil ,@bg-current-line))))
     `(gui-element ((t (,@bg-current-line ,@fg-default))))
     `(mode-line ((t (:foreground ,ml-text-focus
                      :background ,ml-bg-focus
                      :box nil))))
     `(mode-line-buffer-id ((t (,@fg-purple ,@bg-nil))))
     `(mode-line-inactive ((t (:foreground ,ml-text
                               :background ,ml-bg
                               :box nil))))
     `(mode-line-emphasis ((t (:foreground ,ml-text-focus ,@i))))
     `(mode-line-highlight ((t (,@fg-purple ,@b :box nil))))
     `(minibuffer-prompt ((t (,@fg-blue))))
     `(region ((t (,@bg-selection))))
     `(secondary-selection ((t (,@bg-current-line))))

     `(header-line ((t (:inherit mode-line ,@fg-purple ,@bg-nil))))

     `(link          ((t (,@fg-nil ,@u))))
     `(widget-button ((t (,@u))))
     `(widget-field  ((t (,@bg-current-line :box (:line-width 1 :color ,text-color)))))

     ;; whitespace
     `(whitespace-trailing         ((t (,@bg-red ,@fg-nil))))
     `(whitespace-space-after-tab  ((t (,@bg-red ,@u-nil))))
     `(whitespace-space-before-tab ((t (,@bg-red ,@u-nil))))
     `(whitespace-empty            ((t (,@bg-red ,@u-nil))))
     `(whitespace-line             ((t (,@bg-nil ,@fg-red))))
     `(whitespace-indentation      ((t (,@bg-nil ,@fg-aqua))))
     `(whitespace-space            ((t (,@bg-nil ,@fg-selection))))
     `(whitespace-newline          ((t (,@bg-nil ,@fg-selection))))
     `(whitespace-tab              ((t (,@bg-nil ,@fg-selection))))
     `(whitespace-hspace           ((t (,@bg-nil ,@fg-selection))))

     ;; parenthesis matching
     `(show-paren-match    ((t (,@bg-nil     ,@fg-nil    ,@inverse))))
     `(show-paren-mismatch ((t (,@bg-default ,@fg-purple))))

     ;; diff
     `(diff-added       ((t (,@fg-green))))
     `(diff-changed     ((t (,@fg-purple))))
     `(diff-removed     ((t (,@fg-orange))))
     `(diff-header      ((t (,@fg-aqua   ,@bg-nil))))
     `(diff-file-header ((t (,@fg-blue   ,@bg-nil))))
     `(diff-hunk-header ((t (,@fg-purple ,@bg-nil))))

     ;; ediff
     `(ediff-current-diff-A ((t (,@fg-nil :background ,ediff-bg-current))))
     `(ediff-current-diff-B ((t (,@fg-nil :background ,ediff-bg-current))))
     `(ediff-current-diff-C ((t (,@fg-nil :background ,ediff-bg-current))))
     `(ediff-even-diff-A    ((t (,@fg-nil :background ,ediff-bg-even))))
     `(ediff-even-diff-B    ((t (,@fg-nil :background ,ediff-bg-even))))
     `(ediff-even-diff-C    ((t (,@fg-nil :background ,ediff-bg-even))))
     `(ediff-odd-diff-A     ((t (,@fg-nil :background ,ediff-bg-odd))))
     `(ediff-odd-diff-B     ((t (,@fg-nil :background ,ediff-bg-odd))))
     `(ediff-odd-diff-C     ((t (,@fg-nil :background ,ediff-bg-odd))))
     `(ediff-fine-diff-A    ((t (,@fg-nil :background ,ediff-bg-fine))))
     `(ediff-fine-diff-B    ((t (,@fg-nil :background ,ediff-bg-fine))))
     `(ediff-fine-diff-C    ((t (,@fg-nil :background ,ediff-bg-fine))))

     ;; magit
     `(magit-branch         ((t (,@fg-green))))
     `(magit-header         ((t (,@b :inherit nil))))
     `(magit-item-highlight ((t (,@bg-nil :inherit highlight))))
     `(magit-log-graph      ((t (,@fg-comment))))
     `(magit-log-sha1       ((t (,@fg-yellow))))
     `(magit-section-title  ((t (,@fg-blue ,@b))))

     `(magit-log-head-label-bisect-bad  ((t (,@fg-red))))
     `(magit-log-head-label-bisect-good ((t (,@fg-green))))
     `(magit-log-head-label-default     ((t (,@fg-yellow ,@b :box nil))))
     `(magit-log-head-label-local       ((t (,@fg-purple ,@b :box nil))))
     `(magit-log-head-label-remote      ((t (,@fg-purple ,@b :box nil))))
     `(magit-log-head-label-tags        ((t (,@fg-aqua   ,@b :box nil))))

     ;; compilation
     `(compilation-column-number ((t (,@fg-yellow))))
     `(compilation-line-number   ((t (,@fg-yellow))))
     `(compilation-message-face  ((t (,@fg-blue))))

     ;; Grep
     `(grep-context-face ((t (,@fg-comment))))
     `(grep-error-face   ((t (,@fg-red ,@b ,@u))))
     `(grep-hit-face     ((t (,@fg-blue))))
     `(grep-match-face   ((t (,@fg-nil ,@bg-nil :inherit match))))

     `(regex-tool-matched-face ((t (,@fg-nil ,@bg-nil :inherit match))))

     )))


(provide-theme 'void)
