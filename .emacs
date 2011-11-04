;; Start counting time
(defvar *emacs-load-start* (current-time))
;; Avoid the annoying startup message.
(setq inhibit-startup-message t)

;; Set load paths
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/emacs-rails")
(add-to-list 'load-path "~/.emacs.d/rinari/rhtml")

;; Load libraries
(require 'ruby-electric)
(require 'ruby-mode)
(require 'inf-ruby)
(require 'snippet)
(require 'find-recursive)
(require 'rails)
(require 'yaml-mode)
(require 'fuzzy-match)
(require 'ido)
(require 'php-mode)
(require 'haml-mode)

(require 'linum)
(global-linum-mode t)

(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Enable inline files names
(ido-mode t)

;; Use different mode for ERB
(autoload 'rhtml-mode "rhtml-mode" "RHTML" t)
(add-to-list 'auto-mode-alist '("\\.rhtml$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.html\.erb$" . rhtml-mode))

;aml-mode "yaml-mode" "YAML" t)
(setq auto-mode-alist
            (append '(("\\.yml$" . yaml-mode)) auto-mode-alist))

;; Use Steve Yegge's js2 mode for Javascript
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(define-key global-map (kbd "RET") 'newline-and-indent)

(setq frame-background-mode 'dark)
(frame-update-face-colors (selected-frame))

(put 'downcase-region 'disabled nil)

;; Disable menu bar
(menu-bar-mode nil)

(setq frame-background-mode 'dark)
(frame-update-face-colors (selected-frame))

(global-set-key [f9] 'test)
(global-set-key [f10] 'test-all)
;;(global-set-key [f11] 'compile)
(global-set-key [f3] 'goto-line)

(put 'downcase-region 'disabled nil)

(setq inhibit-startup-echo-area-message t)
(setq initial-scratch-message nil)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(setq-default transient-mark-mode t)

(line-number-mode t)
(setq require-final-newline t)

;; I don't like the default colors :)
(set-face-background 'flymake-errline "red4")
(set-face-background 'flymake-warnline "dark slate blue")


;;;
;; rails mode
(defun try-complete-abbrev (old)
    (if (expand-abbrev) t nil))

(setq hippie-expand-try-functions-list
      '(try-complete-abbrev
        try-complete-file-name
        try-expand-dabbrev))


(set-face-foreground 'font-lock-comment-face "Red" )
(set-variable font-lock-comment-face 'font-lock-comment-face)

;; Add color to a shell running in emacs 'M-x shell'
  (autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
  (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(message "--== My .emacs file was loaded in %d s ==--" (destructuring-bind (hi lo ms) (current-time)
				     (- (+ hi lo) (+ (first *emacs-load-start*)
						     (second *emacs-load-start*)))))
