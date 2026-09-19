# =========================================================
# Keybindings
# =========================================================

# Cursor shape per vi mode
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BEAM
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
ZVM_VISUAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK

# Disable command mode line highlight
ZVM_VI_HIGHLIGHT_BACKGROUND=none
ZVM_VI_HIGHLIGHT_FOREGROUND=none
ZVM_VI_HIGHLIGHT_EXTRASTYLE=none

# zsh-vi-mode resets all bindings on init, so custom bindings
# must be registered via this hook to survive.
zvm_after_init() {
  # Ctrl+Right / Ctrl+Left
  bindkey '^[[1;5C' forward-word
  bindkey '^[[1;5D' backward-word

  # Ctrl+F -> fzf file picker (no hidden files)
  bindkey '^F' _fzf_file_no_hidden

  # Ctrl+\ -> toggle autosuggestions
  bindkey '^\' autosuggest-toggle

  # Up/Down -> history search by substring
  # Mapeia tanto o modo viins (inserção) quanto vicmd (normal)
  # e cobre os dois tipos de sequências de escape (^[[A e ^[OA)
  zvm_bindkey viins '^[[A' history-substring-search-up
  zvm_bindkey viins '^[OA' history-substring-search-up
  zvm_bindkey viins '^[[B' history-substring-search-down
  zvm_bindkey viins '^[OB' history-substring-search-down

  zvm_bindkey vicmd '^[[A' history-substring-search-up
  zvm_bindkey vicmd '^[OA' history-substring-search-up
  zvm_bindkey vicmd '^[[B' history-substring-search-down
  zvm_bindkey vicmd '^[OB' history-substring-search-down

  # Atalhos padrão do Vim no vicmd (opcional: 'k' e 'j' para buscar substring)
  zvm_bindkey vicmd 'k' history-substring-search-up
  zvm_bindkey vicmd 'j' history-substring-search-down
}