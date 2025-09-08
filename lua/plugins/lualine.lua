return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lualine = require('lualine')

    -- Color table for highlights
    local colors = {
      bg       = '#202328',
      fg       = '#bbc2cf',
      yellow   = '#ECBE7B',
      cyan     = '#008080',
      darkblue = '#081633',
      green    = '#98be65',
      orange   = '#FF8800',
      violet   = '#a9a1e1',
      magenta  = '#c678dd',
      blue     = '#51afef',
      red      = '#ec5f67',
    }

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    -- Lualine configuration
    local config = {
      options = {
        component_separators = '',
        -- section_separators = '',
        theme = "catppuccin",
      },
      sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = { 'location', 'searchcount' },
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'filetype' },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'branch' },
      },
    }

    -- Helper functions to insert components
    local function ins_b(component)
      table.insert(config.sections.lualine_b, component)
    end

    local function ins_x(component)
      table.insert(config.sections.lualine_x, component)
    end

    local function ins_y(component)
      table.insert(config.sections.lualine_y, component)
    end

    ins_b({
      'diagnostics',
      sources = { 'nvim_diagnostic' },
			symbols = { error = ' ', warn = ' ', info = ' ' },
      diagnostics_color = {
        error = { fg = colors.red },
        warn  = { fg = colors.yellow },
        info  = { fg = colors.cyan },
      },
    })

    -- 중앙에 공간 분할
    -- ins_left({
    --   function() return '%=' end,
    -- })

    -- 오른쪽 섹션에 컴포넌트 추가
    ins_x({
      function()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
        local clients = vim.lsp.get_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
        end
        return msg
      end,
      icon = ' LSP:',
      color = { fg = '#ffffff', gui = 'bold' },
    })

		ins_y {
		  'branch',
		  icon = '',
		  color = { fg = colors.violet, gui = 'bold' },
		}

    ins_y({
      'diff',
      symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
      diff_color = {
        added    = { fg = colors.green },
        modified = { fg = colors.orange },
        removed  = { fg = colors.red },
      },
      cond = conditions.hide_in_width,
    })

    -- 최종적으로 lualine 초기화
    lualine.setup(config)
  end
}

