;;; init.el --- Where all the magic begins
;;
;; This is the first thing to get loaded.
;;

;; Enter debugger if an error is signaled during Emacs startup.
;;
;; This works the same as you boot emacs with "--debug-init" every time, except
;; for errors in "init.el" itself, which means, if there's an error in
;; "init.el", "emacs --debug-init" will entering the debugger, while "emacs"
;; will not; however, if there's an error in other files loaded by init.el,
;; both "emacs" and "emacs --debug-init" will entering the debugger. I don't
;; know why.
(setq debug-on-error t)

;; believe me, you don't need menubar, toolbar nor scrollbar
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; Now install el-get at the very first
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch
          ;; do not build recipes from emacswiki due to poor quality and
          ;; documentation
          el-get-install-skip-emacswiki-recipes)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  ;; build melpa packages for el-get
  (el-get-install 'package)
  (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("melpa" . "http://melpa.milkbox.net/packages/")))
  (el-get-elpa-build-local-recipes))

;; enable git shallow clone to save time and bandwidth
(setq el-get-git-shallow-clone t)

;; Sometimes, we need to experiment with our own recipe, or override the
;; default el-get recipe to get around bugs.
(add-to-list 'el-get-recipe-path "~/.emacs.d/ome-el-get-recipes")

;; Some workaround for emacs version < 24.0, thanks Silthanis@github.
(if (< emacs-major-version 24)
    (defun file-name-base (&optional filename)
      "Return the base name of the FILENAME: no directory, no extension.
FILENAME defaults to `buffer-file-name'."
      (file-name-sans-extension
       (file-name-nondirectory (or filename (buffer-file-name))))))

;; Adopt org-mode 8.x from v0.3, so org-mode should be the first
;; package to be installed via el-get
(defun bmaas/org-mode-setup ()
  ;; markdown export support
  (require 'org-agenda)
  (require 'ox-md))

(add-to-list 'el-get-sources
             '(:name org-mode
                     :after (progn
                              (bmaas/org-mode-setup))))

(el-get 'sync (mapcar 'el-get-source-name el-get-sources))

(defvar bmaas/home-dir (file-name-directory (or load-file-name (buffer-file-name)))
  "emacs config home directory.")

;; load up the core-config
(org-babel-load-file (expand-file-name "core.org" bmaas/home-dir))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-changed ((t (:foreground "color-16"))))
 '(diff-removed ((t (:inherit diff-changed :background "#553333"))))
 '(helm-selection ((t (:background "green" :foreground "color-16"))))
 '(magit-diff-add ((t (:inherit diff-added :background "#5f8700" :foreground "color-16"))))
 '(magit-diff-del ((t (:inherit diff-removed :background "tomato" :foreground "color-16")))))

;; Do not want backtrace window to pop up
(setq debug-on-error nil)

;;; init.el ends here
