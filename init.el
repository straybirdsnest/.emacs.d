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
 ;; add melpa to package source.
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
			 ("popkit" . "http://elpa.popkit.org/packages/")))
 ;; don't display toolbar
(tool-bar-mode -1)
 ;; bind F8 to neotree
(global-set-key [f8] 'neotree-toggle)
 ;; auto show neotree
 ;;(neotree-show)
 ;; bind C-x g to magit-status
(global-set-key (kbd "C-x g") 'magit-status)
 ;; bind C-x M-g to magit-dispatch-popup
(global-set-key (kbd "C-x M-g" 'magit-dispatch-popup)

