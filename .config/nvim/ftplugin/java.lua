local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/home/dirli/java-workspace-root/' .. project_name

Remove_line_between_javax_and_java_imports = function()
  local line_count = vim.api.nvim_buf_line_count(0)
  local lines = vim.api.nvim_buf_get_lines(0, 0, line_count, false)
  local javax_line = 0
  local javax_prefix = "import javax."
  local java_prefix = "import java."
  local empty_line = false
  for i, line in ipairs(lines) do
    if line:sub(1, #javax_prefix) == javax_prefix then
      javax_line = i
      empty_line = false
    end
    if line == "" then
      empty_line = true
    end
    if line:sub(1, #java_prefix) == java_prefix then
      if javax_line == 0 or not empty_line then
        return -- no javax import
      end
      vim.api.nvim_buf_set_lines(0, javax_line, javax_line + 1, true, {})
      return
    end
  end
end

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    -- 💀
    'java', -- or '/path/to/java11_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    -- 💀
    '-jar', '/home/dirli/javals/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
         -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
         -- Must point to the                                                     Change this to
         -- eclipse.jdt.ls installation                                           the actual version


    -- 💀
    '-configuration', '/home/dirli/javals/config_linux',
                    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
                    -- Must point to the                      Change to one of `linux`, `win` or `mac`
                    -- eclipse.jdt.ls installation            Depending on your system.


    -- 💀
    -- See `data directory configuration` section in the README
    '-data', workspace_dir
  },

  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      completion = {
        importOrder = ";javax;java;\\#",
      },
      settings = {
        url = "/home/dirli/.config/java/settings.pref"
      }
    }
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  -- init_options = {
  --   bundles = {
  --     vim.fn.glob("~/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar")
  --   }
  -- },
  on_attach = function(client, bufnr)
    -- With `hotcodereplace = 'auto' the debug adapter will try to apply code changes
    -- you make during a debug session immediately.
    -- Remove the option if you do not want that.
    require('jdtls').setup_dap({ hotcodereplace = 'auto' })

    vim.cmd [[
      command! -buffer JdtCompile lua require('jdtls').compile()
      command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()
      command! -buffer JdtJol lua require('jdtls').jol()
      command! -buffer JdtBytecode lua require('jdtls').javap()
      command! -buffer JdtJshell lua require('jdtls').jshell()

      autocmd BufWritePre <buffer> lua Remove_line_between_javax_and_java_imports()
    ]]

    require('d.lsp.handlers').on_attach(client, bufnr)

    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_buf_set_keymap

    keymap(bufnr, "n", "<A-o>", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
    keymap(bufnr, "n", "<A-z>", "<Cmd>lua Remove_line_between_javax_and_java_imports()<CR>", opts)
    keymap(bufnr, "n", "crv", "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
    keymap(bufnr, "n", "crv", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
    keymap(bufnr, "n", "crc", "<Cmd>lua require('jdtls').extract_constant()<CR>", opts)
    keymap(bufnr, "n", "crc", "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", opts)
    keymap(bufnr, "n", "crm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)

    keymap(bufnr, "n", "<leader>df", "<Cmd>lua require'jdtls'.test_class()<CR>", opts)
    keymap(bufnr, "n", "<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", opts)
  end
}

-- debug bundles
local bundles = {
  vim.fn.glob("~/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"),
};
vim.list_extend(bundles, vim.split(vim.fn.glob("~/vscode-java-test/server/*.jar"), "\n"))

config['init_options'] = {
  bundles = bundles;
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)

