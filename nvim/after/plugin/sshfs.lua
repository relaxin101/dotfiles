--ssh connection
require('remote-sshfs').setup({
  connections = {
    ssh_configs = { -- which ssh configs to parse for hosts list
    vim.fn.expand "$HOME" .. "/.ssh/config",
    vim.fn.expand "$HOME" .. "/.ssh/configs/uni",
    --"/etc/ssh/ssh_config",
    -- "/path/to/custom/ssh_config"
  },
  mounts = {
      unmount_on_exit = true
  },
  on_disconnect = {
      clean_mount_folders = true
  }

}
      })
require('telescope').load_extension 'remote-sshfs' --not working

