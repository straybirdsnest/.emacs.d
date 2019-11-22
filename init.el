
;; set all sub directories of ~/.emacs.d/elpa as default DIR

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(let ((default-directory  "~/.emacs.d/elpa/"))
  (normal-top-level-add-subdirs-to-load-path))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(package-selected-packages
   (quote
    (flycheck-inline which-key flycheck-rtags company-rtags ivy-rtags rtags modern-cpp-font-lock flycheck amx symbol-overlay counsel-etags clang-format dash zone-nyan yaml-mode transient popwin nyan-mode neotree markdown-mode+ magit kv js2-mode java-snippets highlight-chars groovy-mode gradle-mode font-lock+ counsel company-tern blank-mode all-the-icons)))
 '(safe-local-variable-values
   (quote
    ((eval setq rtags-path "/home/otakuplus/Projects/rtags/build/bin/")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; set font size
(set-face-attribute 'default nil :height 180)
;; add melpa to package source.
(setq package-archives '(
                         ("gnu" . "https://elpa.gnu.org/packages/")
;;                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
			 ))
;;                         ("popkit" . "http://elpa.popkit.org/packages/")))
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
;; (global-set-key [f8] 'neotree-toggle)
;; neotree follow current file
(setq neo-smart-open t)
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
(nyan-toggle-wavy-trail)
;; bind C-x M-g to magit-dispatch-popup
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)
;; auto toggle company-mode
(add-hook 'after-init-hook 'global-company-mode)
;; use C-n C-p to navigate company suggesstion
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))
;; use js2mode over javascript mode
(add-to-list 'auto-mode-alist `(,(rx ".js" string-end) . js2-mode))
;; set path enviroment
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin/tern/bin"))
(setq exec-path (append exec-path '("/usr/local/bin/tern/bin")))
;; tern
;; (add-to-list 'load-path "/usr/local/bin/tern")
;; (autoload 'tern-mode "tern.el" nil t)
;; (add-hook 'js2-mode-hook (lambda () (tern-mode t)))
;; add company-tern to backend
;; (with-eval-after-load 'company
;;  (add-to-list 'company-backends 'company-tern))

;; bind C-x g to magit-status
(global-set-key (kbd "C-x g") 'magit-status)
;; enable neotree-toggle
(add-hook 'after-init-hook #'neotree-toggle)
;; enable blank mode
(require 'blank-mode)
(global-blank-mode t)
;; show tabs as "^I"
;; (set-face-background 'blank-tab-face "^I")
;; (set-face-frontground 'blank-tab-face "^I")
;; ivy
;; enable ivy
(ivy-mode 1)
;; basic setup
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "%d/%d ")
;; ivy use Swiper to prompt
(setq ivy-use-selectable-prompt t)
;; use Swiper instead of i-search
(global-set-key "\C-s" 'swiper)
;; search line number
(setq swiper-include-line-number-in-search t)
;; use counsel-M-x and counsel-find-file
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
;; lsp-mode
;; (require 'lsp-mode)
;; set c/c++ mode using lsp-mode
;; (add-hook 'c-mode-hook #'lsp)
;; (add-hook 'c++-mode-hook #'lsp)
;; debug clang io
;; (setq lsp-log-io t)
;; use flycheck only
;; (setq lsp-prefer-flymake nil)
;; flycheck-clang-tidy
;; (require 'flycheck-clang-tidy)
;; (eval-after-load 'fly-check
;;  '(add-hook 'flycheck-mode-hook #'flycheck-clang-tidy-setup))
;; lsp-ui
;; (require 'lsp-ui)
;; set up lsp-ui for lsp-mode
;; (add-hook 'lsp-mode-hook 'lsp-ui-mode)
;; use company-lsp backends
;; (require 'company-lsp)
;; (push 'company-lsp company-backends)

;; counsel-etags ignore file over 800KB
(setq counsel-etags-max-file-size 800)
;; counsel-etags ignore build files
(eval-after-load 'counsel-etags
  '(progn
     (add-to-list 'counsel-etags-ignore-directories ' "build*")
     ))
;; counsel-etags update every three minutes
(setq counsel-etags-update-interval 180)
;; update counsel-etags after save file
(add-hook 'prog-mode-hook
          (lambda ()
            (add-hook 'after-save-hook
                      'counsel-etags-virtual-update-tags 'append 'local)))
;;

;; symbol-overlay
(require 'symbol-overlay)
(add-hook 'prog-mode-hook #'symbol-overlay-mode)
(global-set-key (kbd "M-i") 'symbol-overlay-put)
(global-set-key (kbd "M-n") 'symbol-overlay-switch-forward)
(global-set-key (kbd "M-p") 'symbol-overlay-switch-backward)
(global-set-key (kbd "<f7>") 'symbol-overlay-mode)
(global-set-key (kbd "<f8>") 'symbol-overlay-remove-all)
;; modern-cpp-font-lock
(require 'modern-cpp-font-lock)
(modern-c++-font-lock-global-mode t)
;; enable flycheck with c/c++ mode
(add-hook 'c-mode-hook 'flycheck-mode)
(add-hook 'c++-mode-hook 'flycheck-mode)
;; flycheck-inline
(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))
;; rtags and company-rtags
(require 'rtags)
(require 'company-rtags)
(setq rtags-completions-enabled t)
(push 'company-rtags company-backends)
;; enable standard keybinding
(rtags-enable-standard-keybindings)
;; enable auto diagnostics
(setq rtags-autostart-diagnostics t)
;; flycheck-rtags
(require 'flycheck-rtags)
(defun my-flycheck-rtags-setup ()
  "Configure flycheck-rtags for better experience."
  (flycheck-select-checker 'rtags)
  (setq-local flycheck-check-syntax-automatically nil)
  (setq-local flycheck-highlighting-mode nil))
(add-hook 'c-mode-hook #'my-flycheck-rtags-setup)
(add-hook 'c++-mode-hook #'my-flycheck-rtags-setup)
(add-hook 'objc-mode-hook #'my-flycheck-rtags-setup)
;; ivy and rtags
(setq rtags-display-result-backend 'ivy)
;; which-key
(require 'which-key)
(which-key-setup-side-window-right-bottom)
;; clang-format
(global-set-key (kbd "C-c f .") 'clang-format-region)
;; clang-format before save
(defun my-clang-format-before-save ()
  (if (or (eq major-mode 'c++-mode) (eq major-mode 'c-mode))
;;      (progn (message "major c/c++ mode on")
;;             (do-another-things))
      (clang-format-buffer)))
(add-hook 'before-save-hook 'my-clang-format-before-save)

