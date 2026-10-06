# Image Tool

Ubuntu 22.04 / C++17 / GTK+3.0 / OpenCV 4 で構築した画像処理プロジェクトです。黒画像（BGR 3ch）を生成する機能を提供します。  
テストには **doctest** を使用しています。

## ディレクトリ構成

```
├── include/            # ヘッダー（image_tools.hpp）
├── src/                # 実装（image_tool.cpp）
├── tests/              # doctest テスト（test_main.cpp）
├── packages/           # 自作 .deb パッケージ（ローカルのみ）
├── .github/workflows/  # GitHub Actions（CI: make test）
└── Makefile
```

## 必要環境（Ubuntu 22.04）

- g++ (C++17)
- GTK+3.0 (`libgtk-3-dev`)
- OpenCV 4 (`libopencv-dev`)
- pkg-config

```bash
sudo apt-get update
sudo apt-get install -y build-essential pkg-config libgtk-3-dev libopencv-dev
```

## セットアップ

### 1. doctest ヘッダーの配置

シングルヘッダーライブラリ `doctest.h` を `tests/` に配置してください。

```bash
curl -Lo tests/doctest.h https://raw.githubusercontent.com/doctest/doctest/v2.4.11/doctest/doctest.h
```

### 2. 自作ライブラリのインストール

`.deb` を用意したら以下でインストールします

```bash
sudo dpkg -i packages/xxxx.deb
# または
sudo apt-get install -y ./packages/xxx.deb
```

## ビルド & テスト

```bash
make          # run_tests をビルド
make test     # ビルドしてテストを実行
make clean    # 生成物削除
```

テスト成功時の出力例:

```
[doctest] doctest version is "2.4.11"
[doctest] run with "--help" for options
===============================================================================
[doctest] test cases: 1 | 1 passed | 0 failed | 0 skipped
[doctest] assertions: 3 | 3 passed | 0 failed |
[doctest] Status: success!
```

## API

### `cv::Mat create_black_image(int width, int height)`

指定サイズの黒い BGR 3 チャンネル画像を生成して返します（`include/image_tools.hpp:6`）。

```cpp
cv::Mat img = create_black_image(100, 50); // 100x50, CV_8UC3
```

## CI

GitHub Actions（`.github/workflows/test.yml`）は `main` ブランチへの push / PR で自動実行されます。
依存ライブラリをインストールして `make test` を実行します。
