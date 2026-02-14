# nvim-config-generator

基于 [NvChad v2.5](https://nvchad.com/) 定制的 Neovim 配置方案，集成了现代化的开发工具链与美观的 UI。

## 特性

- **快速引导**: 基于 `lazy.nvim` 的极速插件加载。
- **自动主题**: 支持根据 macOS 系统外观（深色/浅色模式）自动切换主题。
- **开箱即用的 LSP**: 预置了 HTML, CSS, TypeScript, C/C++, Rust, Python, Go 等语言的支持。
- **代码格式化**: 集成 `conform.nvim` 实现高效代码格式化。
- **现代化 UI**: 包含 Nvdash 起始页面、状态栏以及美观的颜色方案（默认使用 One Light / Ayu Dark）。

## 如何开始

### 预备工作
- 确保已安装 Neovim (建议 v0.10.0+)。
- 确保已安装 `git`, `ripgrep`, `fd`。

### 安装步骤

1. 克隆仓库：
   ```sh
   git clone https://github.com/ChenKS12138/nvim-config-generator.git ~/nvim-config-generator
   ```

2. 运行安装脚本：
   ```sh
   cd ~/nvim-config-generator
   chmod +x setup.sh
   ./setup.sh
   ```
   *注意：`setup.sh` 会将 `~/.config/nvim` 链接到此仓库目录，并清理旧的缓存数据。*

## 项目结构

```text
.
├── init.lua            # 配置入口
├── setup.sh            # 安装与链接脚本
├── lua/
│   ├── chadrc.lua      # NvChad 界面与主题配置
│   ├── mappings.lua    # 快捷键映射
│   ├── options.lua     # Vim 选项设置
│   ├── configs/        # 插件独立配置 (LSP, 格式化, 自动主题等)
│   └── plugins/        # 插件列表定义
└── README.md
```

## 许可证

本项目采用 [MIT](./liCENSE) 许可证。
