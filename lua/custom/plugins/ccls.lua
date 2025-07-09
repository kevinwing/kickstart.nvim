-- print 'Loaded custom/plugins/ccls.lua'
-- ~/.config/nvim/lua/custom/plugins/ccls.lua
return {
  'neovim/nvim-lspconfig',
  config = function()
    print '✅ ccls plugin loaded'

    require('lspconfig').ccls.setup {
      cmd = { 'ccls' },
      filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
      root_dir = require('lspconfig.util').root_pattern('platformio.ini', 'compile_commands.json', '.ccls', '.git'),
      init_options = {
        compilationDatabaseDirectory = '.', -- you already have compile_commands.json in root
        index = {
          threads = 2,
        },
        clang = {
          excludeArgs = {
            '-mlongcalls',
            '-fstrict-volatile-bitfields',
            '-fno-tree-switch-conversion',
          },
        },
      },
    }
  end,
}
