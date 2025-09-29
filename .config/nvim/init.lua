-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.cmd([[
  augroup TransparentBG
    autocmd!
    autocmd VimEnter * hi Normal ctermbg=none guibg=none
    autocmd VimEnter * hi NormalFloat ctermbg=none guibg=none
    autocmd VimEnter * hi SignColumn ctermbg=none guibg=none
    autocmd VimEnter * hi LineNr ctermbg=none guibg=none
    autocmd VimEnter * hi EndOfBuffer ctermbg=none guibg=none
  augroup END
]])
