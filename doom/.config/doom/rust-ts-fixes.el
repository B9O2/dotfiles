(defface my-rust-self-face
  '((t :foreground "#b4637a" :slant italic))
  "Face for self in rust.")

(defface my-rust-builtin-type-face
  '((t :foreground "#286983" :weight bold))
  "Face for primitive types like u64, char.")

(defun my/rust-ts-mode-fixes ()
  "Fix rust-ts-mode mappings to perfectly match Neovim."
  (setq treesit-font-lock-settings
        (append (treesit-font-lock-rules
                 :language 'rust
                 :feature 'custom-overrides
                 :override t
                 '(((primitive_type) @my-rust-builtin-type-face)
                   ((identifier) @my-rust-self-face
                    (:match "\\`self\\'" @my-rust-self-face))
                   ((scoped_use_list path: (identifier) @my-rust-self-face)
                    (:match "\\`self\\'" @my-rust-self-face))))
                treesit-font-lock-settings))
  ;; Put custom-overrides at the very end of the feature list so it overrides
  (setf (nth 3 treesit-font-lock-feature-list)
        (append (nth 3 treesit-font-lock-feature-list) '(custom-overrides)))
  (treesit-font-lock-recompute-features)
  
  ;; Map attributes to subtle text instead of Iris/purple
  (face-remap-add-relative 'font-lock-preprocessor-face :foreground "#908caa"))

(add-hook 'rust-ts-mode-hook #'my/rust-ts-mode-fixes)
