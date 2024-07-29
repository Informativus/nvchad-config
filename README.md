Вот переведенные таблицы на английский:

## Nvim

| Key Combination | Action                                                                                                                                                                                                    | Mode |
| :-------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----- |
|        `V`      | Select the entire line of text. Switches to visual mode                                                                                                                                                  | v     |
|        `O`      | Insert text above the current line                                                                                                                                                                        | n     |
|        `o`      | Insert text below the current line                                                                                                                                                                        | n     |
|       `za`      | Toggle fold under the cursor                                                                                                                                                                               | n     |
|       `zM`      | Fold all folds                                                                                                                                                                                             | n     |
|       `zR`      | Unfold all folds                                                                                                                                                                                           | n     |
|       `zc`      | Close fold under the cursor                                                                                                                                                                                 | n     |
|       `viw`     | Select the word under the cursor                                                                                                                                                                            | n     |
|       `yiw`     | Yank (copy) the word under the cursor                                                                                                                                                                     | n     |
|       `diw`     | Delete the word under the cursor                                                                                                                                                                           | n     |
|       `dip`     | Delete everything until the paragraph                                                                                                                                                                     | n     |
|        `f`      | Move to the next occurrence of the specified character in the line (if the character exists after the cursor).<br>Allows navigation through found characters. <br>See: [[nvim-materials#^info2]]  | n     |
|        `F`      | Move to the previous occurrence of the specified character in the line (if the character exists before the cursor).<br>Allows navigation through found characters. <br>See: [[nvim-materials#^info2]] | n     |
|        `|`      | Move to the beginning of the line                                                                                                                                                                           | n     |
|        `%`      | Move between matching pairs of parentheses, brackets, or braces                                                                                                                                           | n     |
|        `[`      | Move up by paragraph (i.e., to the next paragraph break)                                                                                                                                                  | n     |
|        `]`      | Move down by paragraph                                                                                                                                                                                     | n     |
|        `*`      | Search for the word under the cursor. <br>Allows navigation through found words. <br>See: [[nvim-materials#^info1]]<br>                                                          | n     |
|        `\`      | Open a vertical split window. Allows navigation between windows. See: [[nvim-materials#^info4]]                                                                                                          | n, v  |
|        `/`      | Search for words in the file. Allows navigation through words. See: [[nvim-materials#^info1]]                                                                                                              | n     |
|      `<S-j>`    | Move the selected text down                                                                                                                                                                                | v     |
|      `<S-k>`    | Move the selected text up                                                                                                                                                                                  | v     |
|      `<C-o>`    | Navigate through recently executed actions                                                                                                                                                               | n, v  |
|     `<C-w><C-o>`| Close all open windows                                                                                                                                                                                      | n, v  |
|     `<C-w><C-q>`| Close the current window                                                                                                                                                                                   | n, v  |
|      `<C-\>`    | Toggle terminal                                                                                                                                                                                            | n, v  |
|   `dt<element>` | Delete until the specified element and add it to the buffer                                                                                                                                               | n     |
|   `yi<element>` | Yank (copy) the content inside the specified element                                                                                                                                                      | n     |
|   `ci<element>` | Change the content inside the specified element (`[]`, `()`, `{}`)                                                                                                                                         | n     |
|  `dit<element>` | Delete everything inside the tag. See: [[nvim-materials#^info3]]                                                                                                                                           | n     |
|   `<leader>cx`  | Close all open windows                                                                                                                                                                                      | n     |
|   `<leader>cq`  | Close the current window and save changes                                                                                                                                                                  | n     |
|    `<leader>n`  | Toggle line numbers                                                                                                                                                                                          | n     |
|   `<leader>ph`  | Show the last change in the current line                                                                                                                                                                    | n     |
|   `<leader>ts`  | Show all tests in the project with their descriptions                                                                                                                                                      | n     |

>[!info] Note 1: Navigation options:
> `n` - move down through found words 
> `N` - move up through found words

^info1

>[!info] Note 2: Navigation options:
> `;` - navigate through found characters 

^info2

>[!info] Note 3: Navigation options:
> Delete content inside HTML tags. Example: 
> `<div style="color: yellow;">Hello</div>`
> Will delete the text inside the `div` tag.

^info3

>[!info] Note 4: Navigation options:
> `^w` - move between open windows {
> `l` - move right
> `h` - move left
>}

^info4

## NeoTree

| Key Combination | Action                                  | Mode |
| :-------------- | --------------------------------------- | ----- |
| `u`             | Rename with specifying folder           |       |
| `r`             | Rename file with specifying format      |       |
| `e`             | Rename file without specifying format   |       |

