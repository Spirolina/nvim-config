return {
  {
    "folke/tokyonight.nvim",
    lazy = false, -- Hemen yüklenmesi için
    priority = 1000, -- Önce yüklenmesini sağlar
    config = function()
      vim.cmd([[colorscheme tokyonight]]) -- Temayı aktif eder
    end,
  },
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    table.insert(
      opts.sections.lualine_x,
      2,
      LazyVim.lualine.status(LazyVim.config.icons.kinds.Copilot, function()
        local clients = package.loaded["copilot"] and LazyVim.lsp.get_clients({ name = "copilot", bufnr = 0 }) or {}
        if #clients > 0 then
          local status = require("copilot.api").status.data.status
          return (status == "InProgress" and "pending") or (status == "Warning" and "error") or "ok"
        end
      end)
    )
  end,
}
