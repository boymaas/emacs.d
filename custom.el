(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(cider-macroexpansion-display-namespaces nil)
 '(cider-macroexpansion-suppress-namespaces nil)
 '(cljr-auto-clean-ns nil)
 '(cljr-auto-sort-ns nil)
 '(cljr-favor-prefix-notation nil)
 '(cljr-thread-all-but-last t)
 '(cljr-use-multiple-cursors nil)
 '(clojure-thread-all-but-last t)
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes
   (quote
    ("1373e3623ed5d758ef06dd19f2c8a736a69a15496c745a113d42230ab71d6b58" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(evil-highlight-closing-paren-at-point-states (quote (not emacs insert replace normal)))
 '(evil-symbol-word-search t)
 '(fci-rule-color "#073642")
 '(global-wakatime-mode t)
 '(helm-input-idle-delay 0.2)
 '(helm-locate-command "mdfind -name %s %s")
 '(helm-mode t)
 '(hs-hide-comments-when-hiding-all nil)
 '(ibuffer-saved-filter-groups
   (quote
    (("org-mode"
      ("org-mode"
       (used-mode . org-mode)))
     ("default"
      ("org-mode"
       (derived-mode . org-mode))
      ("fundamental"
       (used-mode . fundamental-mode))))))
 '(ibuffer-saved-filters
   (quote
    (("gnus"
      ((or
	(mode . message-mode)
	(mode . mail-mode)
	(mode . gnus-group-mode)
	(mode . gnus-summary-mode)
	(mode . gnus-article-mode))))
     ("programming"
      ((or
	(mode . emacs-lisp-mode)
	(mode . cperl-mode)
	(mode . c-mode)
	(mode . java-mode)
	(mode . idl-mode)
	(mode . lisp-mode)))))))
 '(linum-format "%3d ")
 '(magit-merge-arguments (quote ("--no-ff")))
 '(org-agenda-files
   (quote
    ("~/Sites/planning/fortuna.org" "~/Sites/planning/gtd.org" "~/Sites/planning/nationale_beeldbank.org" "~/Sites/planning/mobytron.org")))
 '(package-selected-packages
   (quote
    (zenburn color-theme-sanityinc-solarized sayid rainbow-mode queue persp-mode inflections)))
 '(rspec-use-spring-when-possible nil)
 '(safe-local-variable-values
   (quote
    ((emacs-lisp-docstring-fill-column . 75)
     (eval ignore-errors "Write-contents-functions is a buffer-local alternative to before-save-hook"
	   (add-hook
	    (quote write-contents-functions)
	    (lambda nil
	      (delete-trailing-whitespace)
	      nil))
	   (require
	    (quote whitespace))
	   "Sometimes the mode needs to be toggled off and on."
	   (whitespace-mode 0)
	   (whitespace-mode 1))
     (whitespace-line-column . 80)
     (whitespace-style face tabs trailing lines-tail)
     (require-final-newline . t))))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#cb4b16")
     (60 . "#b58900")
     (80 . "#859900")
     (100 . "#2aa198")
     (120 . "#268bd2")
     (140 . "#d33682")
     (160 . "#6c71c4")
     (180 . "#dc322f")
     (200 . "#cb4b16")
     (220 . "#b58900")
     (240 . "#859900")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#d33682")
     (320 . "#6c71c4")
     (340 . "#dc322f")
     (360 . "#cb4b16"))))
 '(vc-annotate-very-old-color nil)
 '(wakatime-api-key "81c85849-84ca-40d8-bc4c-abff80972244")
 '(wakatime-cli-path "/usr/local/bin/wakatime")
 '(wakatime-python-bin "/usr/local/bin/python"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-changed ((t (:foreground "color-16"))))
 '(diff-removed ((t (:inherit diff-changed :background "#553333"))))
 '(helm-selection ((t (:background "alternateSelectedControlColor" :foreground "alternateSelectedControlTextColor"))))
 '(helm-source-header ((t (:background "#22083397778B" :foreground "white"))))
 '(linum ((t (:background "#2F2F2F" :foreground "#4f4f4f"))))
 '(magit-diff-add ((t (:inherit diff-added :background "green" :foreground "brightblack"))))
 '(magit-diff-del ((t (:inherit diff-removed :background "red" :foreground "black"))))
 '(org-todo ((t (:background "black" :foreground "red" :weight bold)))))
