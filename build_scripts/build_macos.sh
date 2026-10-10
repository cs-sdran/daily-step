#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

# 在项目根目录创建虚拟环境，避免修改系统 Python。
if [[ ! -x .venv/bin/python ]]; then
  python3 -m venv .venv
fi

.venv/bin/python -m pip install -r requirements.txt

# macOS 的 .app 可先使用系统默认图标；src/app.ico 仅用于 Windows。
.venv/bin/python -m PyInstaller \
  --noconfirm --clean --onefile --windowed \
  --name "积跬步" \
  --add-data "src/index.html:." \
  src/main.py

echo "Build complete: dist/积跬步.app"
