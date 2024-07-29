# Keybindings for Nvim and NeoTree

## Overview

This document contains a list of all keybindings used in Nvim and NeoTree that may be useful in your work. This configuration is fully tailored for backend development with Nest.JS.

## Table of Contents
- [Nvim Keybindings](#nvim-keybindings)
- [NeoTree Keybindings](#neotree-keybindings)
- [Notes](#notes)

## Nvim Keybindings

| Key Combination | Action                                                                                                  | Mode |
| :-------------- | :------------------------------------------------------------------------------------------------------- | :--- |
| `V`             | Select the entire line of text. Switch to visual mode.                                                  | n    |
| `O`             | Insert a new line above and enter insert mode.                                                           | n    |
| `o`             | Insert a new line below and enter insert mode.                                                           | n    |
| `za`            | Toggle between folded and unfolded blocks under the cursor.                                              | n    |
| `zM`            | Fold all blocks.                                                                                       | n    |
| `zR`            | Unfold all blocks.                                                                                    | n    |
| `za`            | Close - open the block under the cursor.                                                                | n    |
| `viw`           | Select the word under the cursor.                                                                       | n    |
| `yiw`           | Copy the word under the cursor.                                                                         | n    |
| `diw`           | Delete the word under the cursor.                                                                       | n    |
| `dip`           | Delete everything to the end of the paragraph.                                                           | n    |
| `f`             | Move to the next occurrence of the specified character. Navigation: [Note 2](#note-2)                    | n    |
| `F`             | Move to the previous occurrence of the specified character. Navigation: [Note 2](#note-2)               | n    |
| &#124;             | Move to the beginning of the line.                                                                       | n    |
| `%`             | Move between matching parentheses.                                                                      | n    |
| `[`             | Move to the previous paragraph (page break).                                                            | n    |
| `]`             | Move to the next paragraph.                                                                            | n    |
| `*`             | Search for the word under the cursor. Navigation: [Note 1](#note-1)                                     | n    |
| `h`             | Split the window horizontally.                                                                          | n, v |
| `/`             | Search for a string in the file. Navigation: [Note 1](#note-1)                                         | n    |
| `<S-j>`         | Move the selected text down.                                                                           | v    |
| `<S-k>`         | Move the selected text up.                                                                             | v    |
| `<C-o>`         | Move through recently executed commands.                                                                | n, v |
| `<C-wo>`        | Close all open windows.                                                                               | n, v |
| `<C-wq>`        | Close the current window.                                                                             | n, v |
| `<C-\>`         | Toggle the terminal.                                                                                   | n, v |
| `dt<element>`   | Delete up to the specified element.                                                                     | n    |
| `yi<element>`   | Copy data up to the specified element.                                                                  | n    |
| `ci<element>`   | Change content up to the specified element.                                                             | n    |
| `dit<element>`  | Delete everything inside the specified tag. Navigation: [Note 3](#note-3)                              | n    |
| `<leader>cx`    | Close all open tabs.                                                                                   | n    |
| `<leader>cq`    | Close the current tab and save changes.                                                                 | n    |
| `<leader>n`     | Toggle line numbers.                                                                                   | n    |
| `<leader>ph`    | Show the last change to the line.                                                                       | n    |
| `<leader>ts`    | Show all tests in the project with their descriptions.                                                   | n    |
| `<leader>mp`    | Move the cursor to the specified location.                                                              | n    |
| `<leader>ms`    | Select all words under the cursor.                                                                      | n    |
| `<leader>mo`    | Enter Visual Multiple mode for working with multiple cursors.                                           | n    |
| `<leader>mv`    | Place cursors at the beginning of lines. Use `<S-a>` to move cursors to the end of lines.               | v    |

## NeoTree Keybindings

| Key Combination | Action                                  |
| :-------------- | :--------------------------------------- |
| `u`             | Rename with path to the folder          |
| `r`             | Rename file with format specification   |
| `e`             | Rename file without format specification |
| `d`             | Delete file or folder                   |
| `a`             | Create a new folder                     |

## Notes

> **Note 1:** Navigation options:
> - `n` to move down to the next occurrence
> - `N` to move up to the previous occurrence

> **Note 2:** Navigation by character:
> - `;` to move to the next occurrence of the character

> **Note 3:** Deleting inside HTML tags. Example:
> ```html
> <div style="color: yellow;">Hello</div>
> ```
> The text inside the `<div>` tag will be deleted.

> **Note 4:** Navigation between open tabs:
> - `^w` to switch between tabs (`l` to move right, `h` to move left)
