return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,

    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd>TmuxNavigateLeft<cr>", mode = { "n" } },
      { "<c-j>", "<cmd>TmuxNavigateDown<cr>", mode = { "n" } },
      { "<c-k>", "<cmd>TmuxNavigateUp<cr>", mode = { "n" } },
      { "<c-l>", "<cmd>TmuxNavigateRight<cr>", mode = { "n" } },
      { "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>", mode = { "n" } },
    },
  },
}
