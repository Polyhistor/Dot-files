return {
    "lervag/vimtex",
    ft = {"tex", "pdf"},
    lazy = false,
    config = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_method = "pdflatex"
      vim.g.vimtex_view_general_viewer = "zathura"
      vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_compiler_pdflatex = {
        options = {
          "-shell-escape",
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }
      -- Set up auto-compilation on save
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "tex",
        callback = function()
          vim.api.nvim_create_autocmd("BufWritePost", {
            buffer = 0,
            command = "VimtexCompile",
          })
        end,
      })
    end
  }
