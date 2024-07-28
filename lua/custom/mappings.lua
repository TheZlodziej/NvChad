local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    }
  },
}

M.general = {
  n = {
    ["<C-r>r"] = {
      function()
        local current_word = vim.fn.expand("<cword>")
        vim.ui.input(
          { prompt="Replace \"" .. current_word .. "\" with (esc to cancel): "},
          function(replacement_word)
            if replacement_word == nil then
              return
            end
            current_word = vim.fn.escape(current_word, "\\")
            replacement_word = vim.fn.escape(replacement_word, "\\")
            vim.cmd("%s/\\<" .. current_word .. "\\>/" .. replacement_word .. "/g")
          end
        ) 
      end,
      { noremap = false, silent = true }
    }
  }
}

return M

