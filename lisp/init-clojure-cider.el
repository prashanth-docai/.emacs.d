;;; init-clojure-cider.el --- Cider support for clojure -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun my-clojure-mode-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1) ; for adding require/use/import statements
  ;; This choice of keybinding leaves cider-macroexpand-1 unbound
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(require 'init-clojure)
(require 'clj-refactor)

(defun cider-save-and-refresh ()
  (interactive)
  (save-buffer)
  (call-interactively 'cider-refresh))

(when (maybe-require-package 'cider)
  (after-load 'cider
    (add-hook 'cider-mode-hook 'eldoc-mode)
    (add-hook 'cider-repl-mode-hook 'subword-mode)
    (add-hook 'cider-repl-mode-hook 'paredit-mode)
    (add-hook 'cider-repl-mode-hook 'eldoc-mode))

  (require-package 'flycheck-clojure)
  (after-load 'clojure-mode
    (after-load 'cider

      (add-hook 'clojure-mode-hook #'my-clojure-mode-hook)
      (global-set-key (kbd "M-C-r") 'cider-save-and-refresh)
      (global-set-key (kbd "C-c M-q") 'cider-format-defun)

      (setq nrepl-popup-stacktraces nil)
      (setq cljr-inject-dependencies-at-jack-in nil)
      (after-load 'flycheck
        (flycheck-clojure-setup)))))


(provide 'init-clojure-cider)
;;; init-clojure-cider.el ends here
