# NvChad 2.0 to 2.5 迁移检查清单

请在以下需要迁移的项前打钩 [x]，完成后保存文件。我将根据你的选择进行代码迁移。

## UI 与 高亮 (chadrc.lua)
- [x] **高亮覆盖**: 迁移 `Comment` (斜体) 和 `NvimTreeOpenedFolderName` (绿色加粗) 的样式。

## 按键映射 (mappings.lua)
- [x] **格式化**: `<leader>fm` 触发 `conform.format()`。
- [x] **符号搜索**: `<leader>fg` 触发 `Telescope lsp_document_symbols`。
- [x] **缩进优化**: 可视模式下 `>` 缩进后自动重新选中。

## 插件 (plugins/init.lua)
- [x] **better-escape.nvim**: 添加该插件以支持快速退出插入模式。
- [x] **gitsigns.nvim 定制**: 迁移自定义 signs (▎, ) 和当前行 git blame 显示。
- [x] **NvimTree Git 支持**: 开启 NvimTree 的 git 状态显示和图标高亮。

## 构建工具与语法 (Mason & Treesitter)
- [x] **Mason 自动安装**: 迁移 LSP 服务器、格式化工具的 `ensure_installed` 列表。
- [x] **Treesitter 语法包**: 迁移 `ensure_installed` 列表 (包含 TS, TSX, Rust, Go, Markdown 等)。

## 语言服务 (lspconfig.lua)
- [x] **Inlay Hints**: 在 LSP 附着 (on_attach) 时默认开启内联提示。

## 代码格式化 (conform.lua)
- [x] **更多格式化器**: 迁移 `prettier` (JS/CSS/HTML), `shfmt` (Shell), `rustfmt` (Rust) 的配置。

## 其他功能
- [x] **:Format 命令**: 迁移支持选区格式化的自定义用户命令 `:Format`。
