
;;; Code:

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;;(add-to-list 'auto-mode-alist '("\\.jsx$" . js2-mode))

;;(setq scheme-program-name "/usr/local/bin/mit-scheme")
;;(defun load-xscheme () (require 'xscheme))
;;(add-hook 'scheme-mode-hook 'load-xscheme)

;; copy to os x buffer with appropriate encoding
(defun cp()
  (interactive)
  (shell-command-on-region (region-beginning) (region-end) "pbcopy")
  (setq deactivate-mark " ")
  ) 

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

(show-paren-mode 1)

(require 'cl)
(require 'php-mode)
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-hook 'php-mode-hook 'php-enable-wordpress-coding-style)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))

;;(add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
;;(autoload 'jsx-mode "jsx-mode" "JSX mode" t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(php-mode-coding-style (quote default))
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq-default c-basic-offset 4
			  indent-tabs-mode t)

;;(load "~/.emacs.d/my-loadpackages.el")

(require 'package)
(add-to-list 'package-archives
			 '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; http://www.flycheck.org/manual/latest/index.html
(require 'flycheck)

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
			  (append flycheck-disabled-checkers
					  '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
			  (append flycheck-disabled-checkers
					  '(json-jsonlist)))

(setq tramp-default-method "ssh")

;;; end .emacs



