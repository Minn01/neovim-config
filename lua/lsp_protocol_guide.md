# 🧠 Neovim LSP Keymap Guide

This guide covers how to use LSP (Language Server Protocol) features in Neovim with common keybindings.

---

## 🚀 Navigation Features

| Feature               | LSP Function                 | Keybinding | Description |
|-----------------------|------------------------------|------------|-------------|
| Go to Definition      | `textDocument/definition`    | `gd`       | Jump to where a symbol (function/variable/etc) is defined. |
| Go to Declaration     | `textDocument/declaration`   | `gD`       | Jump to the variable or function declaration. |
| Go to Implementation  | `textDocument/implementation`| `gi`       | Jump to the implementation of an interface or abstract function. |
| Go to Type Definition | `textDocument/typeDefinition`| `gt`       | Jump to the type (e.g., class/interface) of a variable. |
| Find References       | `textDocument/references`    | `gr`       | Find all usages of the symbol in the project. |

---

## 📚 Information & Documentation

| Feature            | LSP Function                 | Keybinding | Description |
|--------------------|------------------------------|------------|-------------|
| Signature Help     | `textDocument/signatureHelp` | `gkb`      | Show function signature info for params |
| Hover Documentation| `textDocument/hover`         | `gk`       | Show inline documentation for the symbol under the cursor. |

---

## 🛠 Refactoring & Actions

| Feature         | LSP Function              | Keybinding | Description |
|-----------------|---------------------------|------------|-------------|
| Rename Symbol   | `textDocument/rename`     | `gr`       | Rename all references to the current symbol. |
| Code Actions    | `textDocument/codeAction` | `gc`       | Show refactors, quick fixes, and other contextual actions. |

---

## 🚨 Diagnostics

| Feature                  | Keybinding   | Description |
|--------------------------|--------------|-------------|
| Go to Previous Diagnostic| `[d`         | Jump to the previous diagnostic issue. |
| Go to Next Diagnostic    | `]d`         | Jump to the next diagnostic issue. |
| Show Diagnostic (Float)  | `<leader>ge` | Show a floating window with diagnostic info. |
| Open Location List       | `<leader>gl` | Open a list of diagnostics for the current file. |

---

## 🔧 Setup Instructions

To make these keymaps work, ensure your LSP setup has an `on_attach` function where you call:

```lua
require("your_module_path.lsp_keymaps").lsp_keymaps(bufnr)

