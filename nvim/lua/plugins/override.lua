-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
if true then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      -- 1. 使用官方支持的 "none" 预设来禁用默认的按键行为
      opts.keymap.preset = "none"

      -- 2. 手动将 <Tab> 键映射为“选择并接受”
      opts.keymap["<Tab>"] = { "select_and_accept" }
      -- 返回修改后的 opts
      return opts
    end,
  },
}
