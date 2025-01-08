return {
  {
    "hsalem7/nvim-k8s",
    config = function()
      vim.g.vim_k8s_toggle_key_map = "<leader>ks"
    end,
    keys = {
      {
        "<leader>ka",
        function()
          require("nvim-k8s").open()
        end,
        desc = "Start Nvim-K8s",
      },
    },
  },
}
