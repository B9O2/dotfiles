;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; Load theme dynamically from theme.el (managed by switch-theme script)
(add-to-list 'custom-theme-load-path (expand-file-name ".local/straight/repos/rose-pine-doom-emacs" doom-emacs-dir))
(defvar my-dynamic-theme-file (expand-file-name "theme.el" doom-private-dir))
(if (file-exists-p my-dynamic-theme-file)
    (load my-dynamic-theme-file t t)
  (setq doom-theme 'doom-one))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(setq projectile-switch-project-action #'projectile-dired)

;; Treesit Language Source
(setq treesit-language-source-alist
      '((rust "https://github.com/tree-sitter/tree-sitter-rust" "master" "v0.21.2")))

(after! eglot
  (add-to-list 'eglot-ignored-server-capabilities :semanticTokensProvider))

;; Align rose-pine-dawn with Neovim
(custom-theme-set-faces! 'doom-rose-pine-dawn
  '(font-lock-type-face :foreground "#56949f" :slant normal)
  '(font-lock-builtin-face :foreground "#286983")
  '(font-lock-function-name-face :foreground "#d7827e")
  '(font-lock-keyword-face :foreground "#286983")
  '(font-lock-constant-face :foreground "#ea9d34")
  '(font-lock-function-call-face :foreground "#d7827e")
  '(rustic-derive-type-face :foreground "#ea9d34")
  '(tree-sitter-hl-face:type :foreground "#56949f")
  '(tree-sitter-hl-face:type.builtin :foreground "#56949f")
  '(tree-sitter-hl-face:constructor :foreground "#ea9d34")
  '(tree-sitter-hl-face:constant :foreground "#ea9d34")
  '(tree-sitter-hl-face:variable.builtin :foreground "#b4637a" :slant italic)
  '(tree-sitter-hl-face:function :foreground "#d7827e")
  '(tree-sitter-hl-face:method :foreground "#d7827e")
  '(tree-sitter-hl-face:method.call :foreground "#d7827e")
  '(tree-sitter-hl-face:function.call :foreground "#d7827e")
  '(tree-sitter-hl-face:function.macro :foreground "#907aa9")
  '(tree-sitter-hl-face:keyword :foreground "#286983")
  
  ;; Punctuation, Brackets and Operators (Subtle/Muted purple-gray instead of yellow)
  '(font-lock-bracket-face :foreground "#908caa")
  '(font-lock-delimiter-face :foreground "#908caa")
  '(font-lock-operator-face :foreground "#908caa")
  
  ;; Unused variables (Make them more readable: muted color + subtle wave underline)
  '(eglot-diagnostic-tag-unnecessary-face :foreground "#797593" :underline '(:style wave :color "#797593"))
  
  ;; Variables and properties
  '(font-lock-variable-name-face :foreground "#464261")
  '(font-lock-property-use-face :slant italic)
  '(font-lock-property-name-face :foreground "#56949f" :slant italic)
  )

;; Use the modern rust-ts-mode instead of rustic-mode to get true tree-sitter parsing
(add-to-list 'major-mode-remap-alist '(rustic-mode . rust-ts-mode))
(add-to-list 'major-mode-remap-alist '(rust-mode . rust-ts-mode))

;; Ensure LSP (eglot) starts automatically for rust-ts-mode
(add-hook 'rust-ts-mode-local-vars-hook #'lsp!)
;; Disable the broken default rust-cargo flycheck checker (eglot will handle diagnostics)
(add-hook 'rust-ts-mode-hook (lambda () (setq-local flycheck-disabled-checkers '(rust-cargo))))


;; Pin tree-sitter-rust to v0.21.2 to avoid ABI version 15 mismatch on Emacs 30.
;; This makes the environment 100% reproducible across machines.
(setq treesit-language-source-alist
      '((rust "https://github.com/tree-sitter/tree-sitter-rust" "v0.21.2")))

(load! "rust-ts-fixes")

