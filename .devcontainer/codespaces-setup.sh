#!/bin/bash

set -eu

# GitHub Codespaces 上でのみ、
# LaTeX Workshop の PDF Viewer をブラウザ表示に変更する。
#
# ローカルの macOS / Windows Dev Container では何もしない。

if [ "${CODESPACES:-}" = "true" ]; then
    echo "GitHub Codespaces detected."
    echo "Configuring LaTeX Workshop PDF viewer for browser mode."

    mkdir -p .vscode

    cat > .vscode/settings.json <<'EOF'
{
  "latex-workshop.view.pdf.viewer": "browser"
}
EOF

    # Codespaces固有の設定なのでGit管理対象にはしない
    if [ -d .git ]; then
        grep -qxF ".vscode/settings.json" .git/info/exclude 2>/dev/null \
            || echo ".vscode/settings.json" >> .git/info/exclude
    fi
fi
