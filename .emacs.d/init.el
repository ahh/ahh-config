;  PATH AND INCLUDES

; Where all my stuff lies
(setq load-path (cons "~/.emacs.d/my-elisp" load-path))

; any per-system customization that can't safely be put in HEAD
(load-file "~/.emacs.d/local.el")


; KEYBINDINGS
(defun indent-or-complete ()
      "Complete if point is at end of a word, otherwise indent line."
      (interactive)
      (if (looking-at "\\>")
          (dabbrev-expand nil)
        (indent-for-tab-command)
        ))

(add-hook 'find-file-hooks (function (lambda ()
 (local-set-key "\t" 'indent-or-complete))))
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

(global-set-key "\M-/" 'hippie-expand)


; ALIASES

(defalias 'qrr 'query-replace-regexp)


; MODES

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(add-hook 'c-mode-common-hook 'turn-on-font-lock)
(show-paren-mode 1)

(require 'cuda-mode)
(add-to-list 'auto-mode-alist '("\\.cu$" . cuda-mode))
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))


; WHITESPACE
(require 'whitespace)
(setq-default indent-tabs-mode nil)
(setq-default show-trailing-whitespace t)
(setq-default default-indicate-empty-lines t)
(setq require-final-newline "ask")


; RANDOM CUSTOMIZATIONS

; Font lock et al.
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(global-font-lock-mode 1)
(set-face-bold-p 'font-lock-keyword-face t)
(set-face-italic-p 'font-lock-comment-face t)

; Strip the screen of useless stuff.
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(setq inhibit-startup-screen t)

; My favorite generally useful packages.
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

