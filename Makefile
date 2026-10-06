# コンパイラ設定
CXX      := g++
CXXFLAGS := -std=c++17 -Wall -Wextra -O2

# インクルードパス
INCLUDES := -Iinclude -Itests

# pkg-config で外部ライブラリのフラグを取得
PKGS     := gtk+-3.0 opencv4
PKG_CFLAGS := $(shell pkg-config --cflags $(PKGS))
PKG_LIBS   := $(shell pkg-config --libs $(PKGS))

# リンク設定（自作ライブラリ -lmycustom を追加）
#LDFLAGS  := $(PKG_LIBS) -lmycustom

# ソースコードと出力バイナリ
SRCS     := src/image_tool.cpp tests/test_main.cpp
TARGET   := run_tests

.PHONY: all test clean

all: $(TARGET)

# テスト用バイナリのビルド
$(TARGET): $(SRCS)
	$(CXX) $(CXXFLAGS) $(INCLUDES) $(PKG_CFLAGS) $^ $(LDFLAGS) -o $@

# ビルドしてテストを実行
test: $(TARGET)
	./$(TARGET)

# 生成物の削除
clean:
	rm -f $(TARGET)