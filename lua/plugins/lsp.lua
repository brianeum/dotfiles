local keyMapper = require('utils.keyMapper').mapKey
return {
  {
    "williamboman/mason.nvim",
      config = function()
        require('mason').setup()
      end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { "lua_ls", "clangd" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({})
      lspconfig.clangd.setup({})
      lspconfig.fortls.setup({
        cmd = { "/path/to/fortls" }, -- `fortls` 설치 경로 입력
        filetypes = { "fortran" }, -- Fortran 파일 확장자
        root_dir = lspconfig.util.root_pattern(".git", "*.f90", "*.f", "*.f03"),
        settings = {
          nthreads = 4, -- 병렬 처리에 사용할 스레드 개수 (필요 시 조정)
          include_dirs = { "./include" }, -- include 경로 (필요에 따라 수정)
          autocomplete = true, -- 자동 완성 활성화
        }
      })

      -- vim.lsp.buf.hover
      -- vim.lsp.buf.definition
      -- vim.lsp.buf.code_action
      keyMapper('K', vim.lsp.buf.hover)
      keyMapper('gd', vim.lsp.buf.definition)
      keyMapper('<leader>ca', vim.lsp.buf.code_action)

    end
  }
}
