<p align="center">Language / 语言：<strong>English</strong> · <a href="README.md">简体中文</a></p>

<div align="center">

# daily-step · 积跬步

**A journey of a thousand miles begins with a single step.**

An offline daily task tracker that helps you make progress one small step at a time.

[Download for Windows](https://github.com/cs-sdran/daily-step/releases/latest) · [Run from source](#run-from-source)

<sub>Local first · No account · No backend · English and Chinese interface</sub>

</div>

## Preview

![daily-step English interface showing today's tasks, progress and the contribution heatmap](docs/screenshots/en.png)

<details>
<summary>View the Chinese interface</summary>
<br>
<img src="docs/screenshots/zh.png" alt="积跬步中文界面：今日任务、完成进度和热力图">
</details>

<sub>The screenshots use demo tasks and contain no real user data.</sub>

## Features

| Feature | Description |
| --- | --- |
| **Today's tasks** | Add, complete, reopen and delete tasks. Progress updates immediately. |
| **History** | Click a day in the heatmap to review its tasks and completion rate. |
| **Contribution heatmap** | See your activity across the last 183 days. |
| **English and Chinese** | Detect the browser language automatically, switch manually and remember your choice. |
| **Offline storage** | Keep your data on your device. No account, server or database is needed. |

## Quick start

### Download the Windows app

Open the [latest release](https://github.com/cs-sdran/daily-step/releases/latest), download **daily-step-Windows.exe** and double-click it. You can place the file on your desktop or create a desktop shortcut.

### Use it in a browser

Download this repository and open [src/index.html](src/index.html). The browser and desktop app keep their data in separate local storage.

## Run from source

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

## Build the desktop app

The scripts create a virtual environment, install dependencies and run PyInstaller. Installing dependencies requires an internet connection; the resulting app works offline.

| Platform | Command | Output |
| --- | --- | --- |
| Windows | <code>build_scripts\build_windows.bat</code> | <code>dist\积跬步.exe</code> |
| macOS | <code>bash build_scripts/build_macos.sh</code> | <code>dist/积跬步.app</code> |

Build on the operating system you are targeting. The current release provides a Windows executable; macOS users can build from source with the script above.

## Data and privacy

Tasks are stored by local date under keys named <code>tasks_YYYY-MM-DD</code>. Your language preference uses <code>app_lang</code>. This version uses **localStorage** and does not create a <code>tasks.json</code> file.

The desktop WebView profile is stored at:

- Windows: <code>%USERPROFILE%\.small_steps\webview</code>
- macOS: <code>~/.small_steps/webview</code>

Opening the HTML file directly in a browser uses that browser's own storage, separate from the desktop app. Back up your tasks before clearing browser or app data.

## Project structure

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
├── README.md             # Simplified Chinese
└── README.en.md          # English
~~~

## License

Released under the [MIT License](LICENSE). Issues and pull requests are welcome.
