local bemol = require("work.bemol")

return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, lazyvim_opts)
      lazyvim_opts.root_dir = function(fname)
        return require("jdtls.setup").find_root({ "packageInfo" }, fname)
      end

      local lazyvim_full_cmd = lazyvim_opts.full_cmd
      lazyvim_opts.full_cmd = function(opts)
        return vim.list_extend(lazyvim_full_cmd(opts), {
          "--jvm-arg=-javaagent:" .. require("mason-registry").get_package("jdtls"):get_install_path() .. "/lombok.jar",
        })
      end

      lazyvim_opts.jdtls = {
        init_options = {
          settings = {
            java = {
              configuration = {
                runtimes = {
                  -- Our Java version is still 1.8 :')
                  { name = "JavaSE-1.8", path = "/usr/lib/jvm/java-1.8.0/", default = true },
                },
              },
            },
          },
          -- TODO: Figure out a way to have this run on BufEnter so it doesn't "lock" onto the first directory opened.
          workspaceFolders = bemol.get_workspace_folders_from_bemol(lazyvim_opts.root_dir()),
        },
      }
    end,
  },
}
