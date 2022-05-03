vim.g.go_fillstruct_mode = 'gopls'
-- By default "snakecase" is used. Current values are: ["snakecase","camelcase", "lispcase", "pascalcase", "keep"].
vim.g.go_addtags_transform = 'snakecase'
vim.g.go_gopls_options = { '-remote=auto' }
vim.g.go_gopls_enabled = 1
