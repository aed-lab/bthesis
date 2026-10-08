#!/bin/bash
# Codespaces 上でのみ PDF ビューアをブラウザタブにする
if [ "$CODESPACES" = "true" ]; then
  mkdir -p .vscode
  cat > .vscode/settings.json <<'EOF'
{
  "latex-workshop.view.pdf.viewer": "browser"
}
EOF
  grep -qx ".vscode/settings.json" .git/info/exclude 2>/dev/null \
    || echo ".vscode/settings.json" >> .git/info/exclude
fi

