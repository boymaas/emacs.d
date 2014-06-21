(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-highlight-closing-paren-at-point-states (quote (not emacs insert replace normal)))
 '(helm-input-idle-delay 0.2)
 '(helm-locate-command "mdfind -name %s %s")
 '(helm-match-plugin-mode t nil (helm-match-plugin))
 '(helm-mode t)
 '(ibuffer-saved-filter-groups (quote (("default" ("org-mode" (derived-mode . org-mode)) ("fundamental" (used-mode . fundamental-mode))))))
 '(ibuffer-saved-filters (quote (("gnus" ((or (mode . message-mode) (mode . mail-mode) (mode . gnus-group-mode) (mode . gnus-summary-mode) (mode . gnus-article-mode)))) ("programming" ((or (mode . emacs-lisp-mode) (mode . cperl-mode) (mode . c-mode) (mode . java-mode) (mode . idl-mode) (mode . lisp-mode)))))))
 '(org-agenda-files (quote ("~/Sites/planning/clojure.org" "~/Sites/planning/gtd.org" "~/Sites/planning/nationale_beeldbank.org" "~/Sites/planning/crypto_trader.org" "~/Sites/planning/sellsimple.org" "~/Sites/planning/fortunebet.org")))
 '(safe-local-variable-values (quote ((eval ignore-errors "Write-contents-functions is a buffer-local alternative to before-save-hook" (add-hook (quote write-contents-functions) (lambda nil (delete-trailing-whitespace) nil)) (require (quote whitespace)) "Sometimes the mode needs to be toggled off and on." (whitespace-mode 0) (whitespace-mode 1)) (whitespace-line-column . 80) (whitespace-style face tabs trailing lines-tail) (require-final-newline . t)))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-changed ((t (:foreground "color-16"))))
 '(diff-removed ((t (:inherit diff-changed :background "#553333"))))
 '(helm-selection ((t (:background "alternateSelectedControlColor" :foreground "alternateSelectedControlTextColor"))))
 '(helm-source-header ((t (:background "#22083397778B" :foreground "white"))))
 '(magit-diff-add ((t (:inherit diff-added :background "none" :foreground "light green"))))
 '(magit-diff-del ((t (:inherit diff-removed :background "none"))))
 '(org-todo ((t (:background "black" :foreground "red" :weight bold)))))
