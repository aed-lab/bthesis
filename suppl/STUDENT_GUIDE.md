# 卒業論文 LaTeX 執筆環境 利用ガイド

## 1. 概要

この環境では、GitHub、VS Code、LaTeX、Dev Container を使って卒業論文を作成します。

主な特徴：

- LaTeX 環境の個別インストールが不要
- Windows / macOS / GitHub Codespaces で共通環境を利用可能
- VS Code の LaTeX Workshop で編集・PDF確認
- GitHub への push 時に GitHub Actions で自動ビルド
- Git による版管理・バックアップ
- 教員側で週次の進捗確認・PDF収集・差分確認が可能

## 2. 共通コンテナ

利用する共通イメージ：

```text
ghcr.io/aed-lab/thesis-latex:2026.1
```

主な収録ツール：

- TeX Live
- latexmk / upLaTeX / upBibTeX / dvipdfmx
- Git
- Python
- latexdiff / latexpand
- pdfinfo

## 3. 推奨：GitHub Codespaces

1. 指定された自分の卒論 Repository を開く
2. `Code` → `Codespaces` → `Create codespace`
3. VS Code が起動したら執筆開始

PC に TeX Live や Docker を直接インストールする必要はありません。

## 4. Repository 構成

```text
main.tex
latexmkrc
src/
fig/
bib/
.devcontainer/
.github/workflows/
```

メインファイルは `main.tex` です。本文は主に `src/` 以下を編集します。

## 5. PDF の生成

`.tex` を保存すると LaTeX Workshop が `latexmk` を実行します。

生成 PDF：

```text
out/main.pdf
```

## 6. Git の使い方

作業の区切りごとに commit / push してください。

```bash
git add .
git commit -m "序論を修正"
git push
```

VS Code の Source Control 画面から操作しても構いません。

## 7. GitHub Actions

push すると自動的に `main.tex` のビルド確認が行われます。

```text
git push
   ↓
GitHub Actions
   ↓
latexmk main.tex
   ↓
Build OK / ERROR
```

GitHub の `Actions` タブで結果を確認できます。

## 8. Windows でローカル利用する場合

推奨構成：

```text
Windows
 ↓
WSL 2
 ↓
Container Engine
 ↓
VS Code Dev Containers
```

Repository は WSL 側の `/home/...` 以下に置くことを推奨します。

```bash
cd ~
git clone <自分のRepository URL>
cd <Repository名>
code .
```

その後 VS Code で `Dev Containers: Reopen in Container` を実行します。

## 9. macOS でローカル利用する場合

Container Engine と VS Code Dev Containers を用意し、Repository を clone します。

```bash
git clone <自分のRepository URL>
cd <Repository名>
code .
```

VS Code で `Dev Containers: Reopen in Container` を実行します。

Windows / macOS / Codespaces で同じ `.devcontainer/devcontainer.json` を利用します。

## 10. コンテナ更新

教員から環境更新の指示があった場合のみ、次を実行してください。

```text
Dev Containers: Rebuild Container
```

または Codespaces の Rebuild Container を利用します。

## 11. 図と文献

図：

```text
fig/
```

文献データ：

```text
bib/
```

生成物である `out/` は通常 Git 管理しません。

## 12. 教員側の週次確認

教員側では GitHub 上の状態から次を確認できます。

- 最新 PDF
- 前回からの差分 PDF
- ページ数と増減
- commit 数
- TeX の追加・削除行数
- 更新ファイル数
- 最終更新日
- Build 成否

**ローカルだけで編集し、GitHub に push していない内容は確認できません。**
定期的に commit / push してください。

## 13. トラブル時

### PDF が生成されない

```bash
latexmk main.tex
```

を実行し、エラーを確認してください。

### GitHub Actions が失敗する

GitHub の `Actions` タブからログを確認してください。

### Codespace / Dev Container の動作がおかしい

`Rebuild Container` を試してください。

GitHub に push 済みのソースは失われません。

## 14. この環境で GitHub を使う理由

GitHub は単なる提出場所ではなく、

- バックアップ
- 版管理
- 作業履歴
- 教員との進捗共有

のために利用します。
