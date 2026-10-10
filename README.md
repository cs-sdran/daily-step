<p align="center">语言 / Language：<a href="#中文">简体中文</a> · <a href="#english">English</a></p>

## 中文

<div align="center">

# 积跬步 · daily-step

**不积跬步，无以至千里。**

一款离线可用的每日任务打卡应用，用简洁的任务列表和热力图记录每一步。

[下载 Windows 版](https://github.com/cs-sdran/daily-step/releases/latest) · [从源码运行](#从源码运行)

<sub>本地优先 · 无账号 · 无后端 · 中英文界面</sub>

</div>

## 界面预览

![积跬步中文界面：今日任务、完成进度、热力图与历史记录](docs/screenshots/zh.png)

<details>
<summary>查看 English 界面</summary>
<br>
<img src="docs/screenshots/en.png" alt="daily-step English interface with tasks, progress, heatmap and history">
</details>

<sub>截图使用演示任务，不包含真实用户数据。</sub>

## 功能

| | |
| --- | --- |
| **今日任务** | 添加、完成、取消完成和删除任务，进度即时更新。 |
| **历史回顾** | 点击热力图中的日期，查看当天任务及完成情况。 |
| **打卡热力图** | 用最近 183 天的颜色方块回看自己的进展。 |
| **中英切换** | 自动识别浏览器语言，也可随时手动切换并记住选择。 |
| **离线保存** | 数据留在本机，无需注册账号、连接服务器或使用数据库。 |

## 快速开始

### 下载 Windows 桌面版

前往 [最新 Release](https://github.com/cs-sdran/daily-step/releases/latest)，下载 **daily-step-Windows.exe** 后双击打开。可以把文件放到桌面，或为它创建桌面快捷方式。

### 直接在浏览器中使用

下载本仓库后，双击 [src/index.html](src/index.html) 即可。浏览器版与桌面版使用各自独立的本地存储。

## 从源码运行

需要 **Python 3.10+**。桌面窗口由 pywebview 提供；界面采用原生 HTML、CSS 与 JavaScript。

**Windows（PowerShell）**

~~~powershell
py -3 -m venv .venv
.\.venv\Scripts\python.exe -m pip install -r requirements.txt
.\.venv\Scripts\python.exe src\main.py
~~~

**macOS**

~~~bash
python3 -m venv .venv
.venv/bin/python -m pip install -r requirements.txt
.venv/bin/python src/main.py
~~~

## 自行打包

打包脚本会自动创建虚拟环境、安装依赖并运行 PyInstaller。首次安装依赖需要联网；生成的应用可离线运行。

| 平台 | 命令 | 输出 |
| --- | --- | --- |
| Windows | <code>build_scripts\build_windows.bat</code> | <code>dist\积跬步.exe</code> |
| macOS | <code>bash build_scripts/build_macos.sh</code> | <code>dist/积跬步.app</code> |

请在对应操作系统上打包。当前 Release 提供 Windows 可执行文件；macOS 用户可按上面的脚本从源码构建。

## 数据与隐私

任务按本地日期保存，键名为 <code>tasks_YYYY-MM-DD</code>；语言偏好保存为 <code>app_lang</code>。当前版本使用 **localStorage**，不生成 <code>tasks.json</code>。

桌面版的 WebView 数据目录：

- Windows：<code>%USERPROFILE%\.small_steps\webview</code>
- macOS：<code>~/.small_steps/webview</code>

浏览器直接打开 HTML 时，任务保存在该浏览器自己的站点存储中，与桌面版不共享。卸载或清理浏览器数据前，请留意其中的任务记录。

## 项目结构

~~~text
积跬步/
├── src/
│   ├── index.html          # 页面、样式与交互
│   ├── main.py             # pywebview 桌面启动器
│   └── app.ico             # Windows 图标
├── docs/screenshots/       # README 界面截图
├── build_scripts/
│   ├── build_windows.bat
│   └── build_macos.sh
├── requirements.txt
├── .gitignore
├── LICENSE
└── README.md             # 中英文完整说明
~~~

## 开源协议

本项目采用 [MIT 许可证](LICENSE)。欢迎提交 Issue 和 Pull Request。

---

## English

<p align="center">Language / 语言：<a href="#中文">简体中文</a> · <strong>English</strong></p>

<div align="center">

### daily-step · 积跬步

**A journey of a thousand miles begins with a single step.**

An offline daily task tracker that helps you make progress one small step at a time.

[Download for Windows](https://github.com/cs-sdran/daily-step/releases/latest) · [Run from source](#run-from-source)

<sub>Local first · No account · No backend · English and Chinese interface</sub>

</div>

### Preview

![daily-step English interface showing today's tasks, progress and the contribution heatmap](docs/screenshots/en.png)

<details>
<summary>View the Chinese interface</summary>
<br>
<img src="docs/screenshots/zh.png" alt="积跬步中文界面：今日任务、完成进度和热力图">
</details>

<sub>The screenshots use demo tasks and contain no real user data.</sub>

### Features

| Feature | Description |
| --- | --- |
| **Today's tasks** | Add, complete, reopen and delete tasks. Progress updates immediately. |
| **History** | Click a day in the heatmap to review its tasks and completion rate. |
| **Contribution heatmap** | See your activity across the last 183 days. |
| **English and Chinese** | Detect the browser language automatically, switch manually and remember your choice. |
| **Offline storage** | Keep your data on your device. No account, server or database is needed. |

### Quick start

#### Download the Windows app

Open the [latest release](https://github.com/cs-sdran/daily-step/releases/latest), download **daily-step-Windows.exe** and double-click it. You can place the file on your desktop or create a desktop shortcut.

#### Use it in a browser

Download this repository and open [src/index.html](src/index.html). The browser and desktop app keep their data in separate local storage.

### Run from source

Requires **Python 3.10+**. pywebview provides the desktop window; the interface uses plain HTML, CSS and JavaScript.

**Windows (PowerShell)**

~~~powershell
py -3 -m venv .venv
.\.venv\Scripts\python.exe -m pip install -r requirements.txt
.\.venv\Scripts\python.exe src\main.py
~~~

**macOS**

~~~bash
python3 -m venv .venv
.venv/bin/python -m pip install -r requirements.txt
.venv/bin/python src/main.py
~~~

### Build the desktop app

The scripts create a virtual environment, install dependencies and run PyInstaller. Installing dependencies requires an internet connection; the resulting app works offline.

| Platform | Command | Output |
| --- | --- | --- |
| Windows | <code>build_scripts\build_windows.bat</code> | <code>dist\积跬步.exe</code> |
| macOS | <code>bash build_scripts/build_macos.sh</code> | <code>dist/积跬步.app</code> |

Build on the operating system you are targeting. The current release provides a Windows executable; macOS users can build from source with the script above.

### Data and privacy

Tasks are stored by local date under keys named <code>tasks_YYYY-MM-DD</code>. Your language preference uses <code>app_lang</code>. This version uses **localStorage** and does not create a <code>tasks.json</code> file.

The desktop WebView profile is stored at:

- Windows: <code>%USERPROFILE%\.small_steps\webview</code>
- macOS: <code>~/.small_steps/webview</code>

Opening the HTML file directly in a browser uses that browser's own storage, separate from the desktop app. Back up your tasks before clearing browser or app data.

### Project structure

~~~text
积跬步/
├── src/
│   ├── index.html          # Interface, styles and interactions
│   ├── main.py             # pywebview desktop launcher
│   └── app.ico             # Windows icon
├── docs/screenshots/       # README screenshots
├── build_scripts/
│   ├── build_windows.bat
│   └── build_macos.sh
├── requirements.txt
├── .gitignore
├── LICENSE
└── README.md             # Complete English and Chinese documentation
~~~

### License

Released under the [MIT License](LICENSE). Issues and pull requests are welcome.
