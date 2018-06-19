;; Legacy commands that I don't what are they for
(require 'ido)
;; (require 'ffap)
;; (require 'linum)
;; (require 'whitespace)
;; (require 'recentf)
(ido-mode t)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

;; do not show welcome screen
(setq inhibit-startup-message t)

;; auto-reload buffers
(global-auto-revert-mode t)

;; Tab-related settings
(setq-default
	tab-width 4
	standard-indent 4
	indent-tabs-mode nil)

;; elpy
(use-package elpy
  :ensure t
  :config
  (setq elpy-rpc-backend "jedi")
  )
(elpy-enable)

;; magit
(use-package magit
  :ensure t
  :init
  (setq magit-last-seen-setup-instructions "1.4.0")
  :config
  (setq magit-auto-revert-mode nil))

;; anaconda-mode
;; (use-package anaconda-mode
;;   :ensure t
;;   :config
;;   (add-hook 'python-mode-hook 'anaconda-mode))

;; enable conda
(use-package conda
  :ensure t
  :config
  (custom-set-variables
     '(conda-anaconda-home "/home/ceshine/miniconda3"))
  (setq-default mode-line-format (cons '(:exec conda-env-current-name) mode-line-format))
  (conda-env-autoactivate-mode t))

;; enable autopep8 on save
(use-package py-autopep8
  :ensure t
  :config
  (add-hook 'python-mode-hook 'py-autopep8-enable-on-save))

(setq
   python-shell-interpreter "ipython"
   python-shell-interpreter-args "--simple-prompt -i"
   python-shell-prompt-regexp "In \\[[0-9]+\\]: "
   python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
   python-shell-completion-setup-code
     "from IPython.core.completerlib import module_completion"
   python-shell-completion-module-string-code
     "';'.join(module_completion('''%s'''))\n"
   python-shell-completion-string-code
     "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

;; enable autocomplete for python
(use-package jedi
  :ensure t
  :config
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t))                 ; optional

;; go-mode indent setting
;; (use-package go-mode
;;   :config
;;   (add-hook 'go-mode-hook
;;     (lambda ()
;;       (setq-default)
;;       (setq tab-width 4)
;;       (setq standard-indent 4)
;;       (setq indent-tabs-mode nil))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit autoface-default :stipple nil :background "#d6d6d6" :foreground "#212121" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "unknown" :family "Ubuntu Mono"))))
 '(column-marker-1 ((t (:background "red"))))
 '(diff-added ((t (:foreground "cyan"))))
 '(flymake-errline ((((class color) (background light)) (:background "Red"))))
 '(font-lock-comment-face ((((class color) (min-colors 8) (background light)) (:foreground "red"))))
 '(fundamental-mode-default ((t (:inherit default))))
 '(highlight ((((class color) (min-colors 8)) (:background "white" :foreground "magenta"))))
 '(isearch ((((class color) (min-colors 8)) (:background "yellow" :foreground "black"))))
 '(linum ((t (:foreground "black" :weight bold))))
 '(region ((((class color) (min-colors 8)) (:background "white" :foreground "magenta"))))
 '(secondary-selection ((((class color) (min-colors 8)) (:background "gray" :foreground "cyan"))))
 '(show-paren-match ((((class color) (background light)) (:background "black"))))
 '(vertical-border ((t nil))))

;; ------------
;; -- Macros --
;; ------------
(global-set-key "\C-c;" 'comment-or-uncomment-region)

;; Auto refresh buffer upon changes
(global-auto-revert-mode t)

;; Delete trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Flycheck
(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(conda-anaconda-home "/home/ceshine/miniconda3")
 '(package-selected-packages
   (quote
    (elpy flycheck jedi py-autopep8 virtualenvwrapper magit use-package))))
