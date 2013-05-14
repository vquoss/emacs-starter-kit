(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)


(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-bindings ess yasnippet)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(require 'ess-site)

(auto-fill-mode -1)

;; (setq x-select-enable-clipboard t)
;; (setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)

;; Develop and keep personal snippets under ~/.emacs.d/plugins/mysnippets
(setq yas/root-directory "~/.emacs.d/plugins/mysnippets")

;; Load the snippets
(yas/load-directory yas/root-directory)

(setq auto-mode-alist (cons '("\\.hql$" . sql-mode) auto-mode-alist))
