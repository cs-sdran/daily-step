"""积跬步：将本地 index.html 装入持久化的桌面窗口。"""

import sys
from pathlib import Path

import webview


def main():
    base = Path(getattr(sys, "_MEIPASS", Path(__file__).resolve().parent))
    html_file = base / "index.html"
    if not html_file.is_file():
        raise FileNotFoundError(f"找不到页面文件：{html_file}")

    # 固定本地静态服务端口与 WebView 配置目录，保证 localStorage 跨启动保留。
    profile = Path.home() / ".small_steps" / "webview"
    profile.mkdir(parents=True, exist_ok=True)
    webview.create_window(
        "积跬步 · daily-step",
        str(html_file),
        width=1180,
        height=820,
        min_size=(850, 620),
        background_color="#F7F8FA",
    )
    webview.start(
        http_server=True,
        http_port=53821,
        private_mode=False,
        storage_path=str(profile),
    )


if __name__ == "__main__":
    main()
