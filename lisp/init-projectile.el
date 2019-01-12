;;; init-projectile.el --- Use Projectile for navigation within projects -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'projectile)
  (add-hook 'after-init-hook 'projectile-mode)

  (after-load 'projectile
<<<<<<< HEAD
    (define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map)
=======
    (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))
>>>>>>> d7eb22eb22454af82bae6181edc962d6abcfea46

    (setq projectile-indexing-method 'native)
    ;; Shorter modeline
    (setq-default
     projectile-mode-line
     '(:eval
       (if (file-remote-p default-directory)
           " Proj"
         (format " Proj[%s]" (projectile-project-name)))))))


(provide 'init-projectile)
;;; init-projectile.el ends here
