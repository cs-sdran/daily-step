# 积跬步 · JiKuiBu

> 不积跬步，无以至千里。一款极简的每日任务打卡与热力图追踪桌面应用。

界面由原生 HTML、CSS 和 JavaScript 编写，桌面窗口由 Python 和 pywebview 提供。运行时无需账号、后端或网络连接。

## 功能特色

- **今日任务**：添加、完成、取消完成和删除任务，实时显示完成进度。
- **历史记录**：点击热力图日期，查看当天任务和完成情况。
- **GitHub 风格热力图**：直观回顾最近约六个月的打卡情况。
- **本地保存**：任务按日期写入 localStorage，键名为 `tasks_YYYY-MM-DD`。
- **中英文切换**：自动匹配浏览器语言，也可在页面右上角手动切换；偏好保存在 `app_lang`。

## 项目结构

```text
积跬步/
├── src/
│   ├── main.py             # pywebview 桌面启动器
│   ├── index.html          # 完整界面、样式和交互
│   └── app.ico             # Windows 图标
├── build_scripts/
│   ├── build_windows.bat
│   └── build_macos.sh
├── .gitignore
├── requirements.txt
├── LICENSE
└── README.md
```

## 从源码运行

需要 Python 3.10+。在项目根目录执行：

### Windows

```powershell
py -3 -m venv .venv
.\.venv\Scripts\python.exe -m pip install -r requirements.txt
.\.venv\Scripts\python.exe src\main.py
```

### macOS

```bash
python3 -m venv .venv
.venv/bin/python -m pip install -r requirements.txt
.venv/bin/python src/main.py
```

也可以直接双击 `src/index.html` 在浏览器中使用；浏览器和桌面版拥有各自独立的 localStorage 数据。

## 打包桌面应用

打包必须在目标系统上进行；Windows 上生成 `.exe`，macOS 上生成 `.app`。首次打包需要联网安装 Python 依赖，打包后的应用离线可用。

### Windows

在项目根目录运行：

```bat
build_scripts\build_windows.bat
```

脚本自动创建 `.venv`、安装 `requirements.txt` 并运行 PyInstaller。生成文件是 `dist\积跬步.exe`。可以把 exe 复制到桌面，或为它创建桌面快捷方式。

等价的手动打包命令：

```powershell
.\.venv\Scripts\python.exe -m PyInstaller --noconfirm --clean --onefile --windowed --name "积跬步" --icon "src\app.ico" --add-data "src\index.html:." "src\main.py"
```

### macOS

在项目根目录运行：

```bash
bash build_scripts/build_macos.sh
```

脚本自动创建 `.venv`、安装依赖并运行 PyInstaller。生成文件是 `dist/积跬步.app`。把 `.app` 拖到“应用程序”文件夹，或放到桌面，即可双击打开。

等价的手动打包命令：

```bash
.venv/bin/python -m PyInstaller --noconfirm --clean --onefile --windowed --name "积跬步" --add-data "src/index.html:." src/main.py
```

## 数据保存位置

当前版本使用 **localStorage**，没有生成 `tasks.json`。桌面版的 WebView 用户数据保存在：

- Windows：`%USERPROFILE%\.small_steps\webview`
- macOS：`~/.small_steps/webview`

数据目录位于用户主目录，不在 exe、`.app` 或 PyInstaller 的临时解压目录中。不要在未备份数据时删除它。直接用浏览器打开 HTML 时，数据保存在该浏览器自己的站点存储中，与桌面版不共享。

## 发布版本

仓库只提交源码和构建脚本。`dist/`、`.exe` 和 `.app` 已由 `.gitignore` 排除。发布时在 GitHub 仓库的 **Releases → Draft a new release** 创建版本标签（例如 `v1.0.0`），上传 `dist/积跬步.exe`；macOS 版建议先将 `.app` 压缩为 ZIP 再上传。填写版本说明后发布，用户从 Releases 下载程序。

## 首次上传到 GitHub

先在 GitHub 创建一个空仓库，再在本项目根目录执行。将示例地址换成你的仓库地址：

```bash
git init
git add .
git commit -m "Initial release"
git branch -M main
git remote add origin https://github.com/你的用户名/你的仓库名.git
git push -u origin main
```

推送前可用 `git status` 检查待提交文件，确认 `.venv/`、`build/` 和 `dist/` 没有进入暂存区。

## 开源协议

本项目采用 [MIT License](LICENSE)。
