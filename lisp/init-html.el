(require-package 'tagedit)
(require-package 'emmet-mode)

(after-load 'sgml-mode
  (tagedit-add-paredit-like-keybindings)
  (define-key tagedit-mode-map (kbd "M-?") nil)
  (define-key tagedit-mode-map (kbd "M-s") nil)
  (add-hook 'sgml-mode-hook (lambda () (tagedit-mode 1))))

(add-auto-mode 'html-mode "\\.\\(jsp\\|tmpl\\|hbs\\)\\'")

(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(add-hook 'sgml-mode-hook 'emmet-mode)
;; Note: ERB is configured in init-ruby

(provide 'init-html)
