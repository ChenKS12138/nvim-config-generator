# GEMINI.md - nvim-config-generator

此文件为 Gemini CLI 提供关于 `nvim-config-generator` 项目的背景信息和操作指南。

## 项目概述

这是一个基于 **NvChad v2.5** 的定制化 Neovim 配置方案。它结合了 NvChad 的美观 UI 与自定义的功能扩展，旨在提供一个开箱即用的开发环境。

### 核心技术栈
- **编辑器**: Neovim (Lua 配置)
- **插件管理**: [lazy.nvim](https://github.com/folke/lazy.nvim)
- **基础框架**: [NvChad v2.5](https://nvchad.com/)
- **LSP 支持**: 通过 `nvim-lspconfig` 支持 HTML, CSS, TypeScript (tsserver), C/C++ (clangd), Rust (rust_analyzer), Python (pylsp), Go (gopls)。
- **代码格式化**: `conform.nvim`
- **终端**: `nvterm`
- **自动主题**: 自研脚本支持根据 macOS 系统外观自动切换深浅色主题。

## 目录结构说明

- `init.lua`: 配置入口文件，负责引导 lazy.nvim 和加载基础模块。
- `setup.sh`: 安装脚本，用于建立符号链接并清理旧的 Neovim 缓存。
- `lua/`
    - `chadrc.lua`: NvChad 的核心配置中心（主题、UI 组件等）。
    - `mappings.lua`: 按键映射定义。
    - `options.lua`: Vim 选项（vim.opt）设置。
    - `autocmds.lua`: 自动命令定义。
    - `configs/`: 存放特定插件的详细配置文件。
        - `autotheme.lua`: macOS 主题同步逻辑。
        - `lspconfig.lua`: LSP 服务端配置。
        - `conform.lua`: 格式化工具配置。
    - `plugins/`:
        - `init.lua`: 自定义插件列表及插件覆盖定义。

## 常用操作

### 安装与设置
执行项目根目录下的脚本进行安装：
```bash
bash setup.sh
```
*注意：该脚本会删除 `~/.config/nvim` 并将当前目录链接至该路径，同时清理 `~/.local/share/nvim` 等数据目录。*

### 启动编辑器
```bash
nvim
```
首次启动时，`lazy.nvim` 会自动下载并安装所有缺失的插件。

### 更新配置
修改 `lua/` 下的文件后，重启 Neovim 即可生效。若是插件变更，可使用 `:Lazy` 命令进行管理。

## 开发规范与建议

1. **遵循 NvChad 结构**: 尽量保持 `chadrc.lua`、`mappings.lua` 和 `options.lua` 的职责分离。
2. **插件配置**: 新增插件应在 `lua/plugins/init.lua` 中声明，其复杂的 `config` 函数建议抽取到 `lua/configs/` 目录下的独立文件中。
3. **LSP 配置**: 若需增加新语言支持，在 `lua/configs/lspconfig.lua` 的 `servers` 列表中添加对应的 LSP server 名称。
4. **主题切换**: 该配置默认会根据 macOS 系统外观切换主题（`one_light` / `ayu_dark`），如需更改切换的目标主题，请修改 `lua/configs/autotheme.lua`。
