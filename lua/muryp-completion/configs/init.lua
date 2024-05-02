local formatting = require 'muryp-completion.configs.icons'
local mapping = require 'muryp-completion.configs.maps'
local cmp = require 'cmp'
local window = require 'muryp-completion.configs.window'
local sources = require 'muryp-completion.configs.sources'
local defaults = require 'cmp.config.default'()

-- command
vim.api.nvim_set_hl(0, 'CmpGhostText', { link = 'Comment', default = true })
-- vim.cmd 'set completeopt=menu,menuone,noselect'
cmp.setup {
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  experimental = {
    ghost_text = {
      hl_group = 'CmpGhostText',
    },
  },
  sorting = defaults.sorting,
  view = {
    window = window,
    experimental = {
      ghost_text = true,
    },
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- for `luasnip` users.
    end,
  },
  mapping = mapping,
  sources = cmp.config.sources(sources.sc1, sources.sc2),
  window = {
    completion = {
      winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
      col_offset = -3,
      side_padding = 0,
    },
  },
  formatting = formatting,
}

require 'muryp-completion.configs.cmdLine'
