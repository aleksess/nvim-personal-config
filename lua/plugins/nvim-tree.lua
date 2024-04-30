local function my_on_attach(bufnr)
  local api = require 'nvim-tree.api'

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<Leader>tt', '<cmd>NvimTreeToggle<cr>')
end

return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  build = ':TSUpdate',
  opts = {
    ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc' },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },

  config = function()
    require('nvim-tree').setup {
      disable_netrw = true,
      hijack_netrw = true,
      hijack_cursor = true,
      hijack_unnamed_buffer_when_opening = false,
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = false,
      },
    }
  end,
  on_attach = my_on_attach,
}
