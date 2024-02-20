local M = {}

function M.get_workspace_folders(root_dir)
  local ws_root_folders = root_dir .. "/.bemol/ws_root_folders"
  if vim.fn.glob(ws_root_folders) ~= "" then
    local workspace_folders = {}
    for line in io.lines(ws_root_folders) do
      table.insert(workspace_folders, "file://" .. line)
    end
    return workspace_folders
  else
    print("WARNING: Bemol file is missing")
    return nil
  end
end

return M
