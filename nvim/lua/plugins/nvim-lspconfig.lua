local bemol = require("work.bemol")
local util = require("lspconfig.util")
return {
  "neovim/nvim-lspconfig",
  event = "LazyFile",
  dependencies = {
    { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
    { "folke/neodev.nvim", opts = {} },
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  opts = {

    --function(_, lazyvim_opts)
    --lazyvim_opts.root_dir = function(fname)
    --  return require("jdtls.setup").find_root({ "packageInfo" }, fname)
    --end
    servers = {
      kotlin_language_server = {
        init_options = {
          storagePath = util.path.join(vim.env.XDG_DATA_HOME, "nvim-data"),
        },
        -- TODO: Figure out a way to have this run on BufEnter so it doesn't "lock" onto the first directory opened.
        --workspaceFolders = bemol.get_workspace_folders(lazyvim_opts.root_dir()),
      },
    },
  },
  --end,
}
