;; set all sub directories of ~/.emacs.d/elpa as default DIR
(let ((default-directory  "~/.emacs.d/elpa/"))
  (normal-top-level-add-subdirs-to-load-path))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (tsdh-dark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; set font size
(set-face-attribute 'default nil :height 180)
;; add melpa to package source.
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("popkit" . "http://elpa.popkit.org/packages/")))
;; don't display toolbar
(tool-bar-mode -1)
;; display column number
(setq column-number-mode t)
;; don't use tab to indent
(setq-default indent-tabs-mode nil)
;; set tab using 4 spaces
(setq tab-width 4)
;; setting c and cperl using tab-width
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)
;; bind F8 to neotree
(global-set-key [f8] 'neotree-toggle)
;; enable all the icons
(require 'all-the-icons)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
;; enable popwin mode
(require 'popwin)
(popwin-mode 1)
;; enable nyan-mode
(require 'nyan-mode)
(nyan-mode t)
(nyan-start-animation)
;; bind C-x g to magit-status
(global-set-key (kbd "C-x g") 'magit-status)
;; bind C-x M-g to magit-dispatch-popup
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)
;; auto toggle company-mode
(add-hook 'after-init-hook 'global-company-mode)
;; use js2mode over javascript mode
(add-to-list 'auto-mode-alist `(,(rx ".js" string-end) . js2-mode))
;; set path enviroment
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))
;; tern
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
;; add company-tern to backend
(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-tern))
;; enable neotree-toggle
(add-hook 'after-init-hook #'neotree-toggle)
