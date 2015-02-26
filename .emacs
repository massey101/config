;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; File: .emacs
;; Author: Jack Massey
;; Emacs configurations file
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;; C ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set tab width
(setq c-basic-offset 8)

;; Add C ElDoc
(setq c-eldoc-includes "`pkg-config gtk+-2.0 --cflags` -I./ -I../ ")
(load "~/.emacs.d/c-eldoc")
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)

;; Line numbering modes
(add-hook 'c-mode-hook 'linum-mode)
(add-hook 'c-mode-hook 'column-number-mode)


;;;;;;;;;;;;;;;;;;;; Python ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Setup line and column numbering
(add-hook 'python-mode-hook 'linum-mode)
(add-hook 'python-mode-hook 'column-number-mode)


;;;;;;;;;;;;;;;;;;;;;;;; PHP ;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Load PHP mode
(load "~/.emacs.d/php-mode")
(require 'php-mode)

; Electric Pairs
;(add-hook 'c-mode-hook
;              (lambda ()
;                (define-key python-mode-map "\"" 'electric-pair)
;                (define-key python-mode-map "\'" 'electric-pair)
;                (define-key python-mode-map "(" 'electric-pair)
;                (define-key python-mode-map "[" 'electric-pair)
;                (define-key python-mode-map "{" 'electric-pair)))


;;;;;;;;;;;;;;;;;;;;;;;; GO ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/go-mode")
(require 'go-mode-autoloads)
(add-hook 'before-save-hook 'gofmt-before-save)

;; Flymake
(add-to-list 'load-path "~/Documents/go/src/github.com/dougm/goflymake")
(require 'go-flymake)


;;;;;;;;;;;;;;;;;;;;;;; Web Mode ;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/web-mode")
(require 'web-mode)
 (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(defun my-web-mode-hook ()
	"Hooks for Web mode."
	(setq web-mode-markup-indent-offset 2)
	(add-hook 'local-write-file-hooks (lambda () (delete-trailing-whitespace) nil))
	(setq-default indent-tabs-mode nil)
	(local-set-key (kbd "RET") 'newline-and-indent)
)

(add-hook 'web-mode-hook 'my-web-mode-hook)

;;;;;;;;;;;;;;;;;;;;; General ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setup emacs backup
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(setq create-lockfiles nil)

; Remove whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

; Autocomplete
(add-to-list 'load-path "~/.emacs.d/auto-complete-1.3.1")
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)


(global-set-key (kbd "M-O <left>") 'hide-other)
(global-set-key (kbd "M-O <right>") 'show-all)
(global-set-key (kbd "M-O <up>") 'outline-previous-heading)
(global-set-key (kbd "M-O <down>") 'outline-next-heading)
(global-set-key (kbd "M-o <left>") 'hide-subtree)
(global-set-key (kbd "M-o <right>") 'show-subtree)
(global-set-key (kbd "M-o <up>") 'outline-previous-visible-heading)
(global-set-key (kbd "M-o <down>") 'outline-next-visible-heading)

(defun cjm-outline-bindings ()
  "sets shortcut bindings for outline minor mode"
  (interactive)
  (local-set-key (kbd "C-up") 'hide-other)
  (local-set-key (kbd "C-down") 'show-all)
  (local-set-key (kbd "C-left") 'hide-subtree)
  (local-set-key (kbd "C-right") 'show-subtree))

(global-set-key (kbd "M-[ a") 'hide-sublevels)
(global-set-key (kbd "M-[ b") 'show-all)
(global-set-key (kbd "M-[ c") 'show-children)
(global-set-key (kbd "M-[ d") 'hide-subtree)

; Outline minor mode
(add-hook 'c-mode-common-hook #'outline-minor-mode)
(add-hook 'python-mode-hook #'outline-minor-mode)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-builtin-face ((t (:foreground "magenta"))))
 '(font-lock-comment-face ((t (:foreground "red"))))
 '(font-lock-constant-face ((t (:foreground "red"))))
 '(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
 '(font-lock-function-name-face ((t (:foreground "blue"))))
 '(font-lock-keyword-face ((t (:foreground "cyan"))))
 '(font-lock-string-face ((t (:foreground "green"))))
 '(font-lock-type-face ((t (:foreground "green"))))
 '(font-lock-variable-name-face ((t (:foreground "yellow"))))
 '(linum ((t (:foreground "brightblack")))))

(defun my-outline-easy-bindings ()
  (require 'outline-mode-easy-bindings nil t))
