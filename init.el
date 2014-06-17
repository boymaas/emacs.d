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

(defvar bmaas/home-dir (file-name-directory (or load-file-name (buffer-file-name)))
  "emacs config home directory.")

;; Do a standard byte-compile of all files in this config dir
(defun bmaas/byte-compile-all ()
  (interactive)
  (byte-recompile-directory bmaas/home-dir 0))

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


;; load up the core-config
(org-babel-load-file (expand-file-name "core.org" bmaas/home-dir))


;; set and load our custom file make sure custom file is compiled and thus
;; reflect latest if changed settings compiled files have preference inside
;; emacs
(setq custom-file "~/.emacs.d/custom.el")
(byte-compile-file custom-file)
(load custom-file)

;; Do not want backtrace window to pop up
(setq debug-on-error nil)

;;; init.el ends here
