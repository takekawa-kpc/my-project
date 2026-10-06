# -------------------------------------------------------------
# 1. 実行環境（OS）の判定
# -------------------------------------------------------------
UNAME_S := $(shell uname -s 2>/dev/null)

# Linux 以外（Git Bash などの Windows 環境）の場合
ifneq ($(UNAME_S),Linux)

# =============================================================
# 【Windows / Git Bash 用の設定】
# 自動的に Docker コンテナを起動し、その中で同じ make ターゲットを実行
# 注: MSYS2 make 側のパス変換を避けるため、Git Bash で明示的に実行する
# =============================================================
DOCKER_IMAGE := secure-clang
GIT_BASH := C:/Program Files/Git/bin/bash.exe

.PHONY: all test clean docker-build

# make test や make clean を叩くと、自動で Docker 内の make に転送される
all test clean:
	@'$(GIT_BASH)' -c 'MSYS_NO_PATHCONV=1 docker run --rm -v "$$(pwd):/workspace" -w /workspace $(DOCKER_IMAGE) make $@'

# ついでにイメージ作成も make コマンドでできるようにしておく
docker-build:
	docker build -t $(DOCKER_IMAGE) .

else

# =============================================================
# 【Linux (Dockerコンテナ内 / GitHub Actions) 用の設定】
# 通常のコンパイルとネイティブ実行
# =============================================================
CXX        := g++
CXXFLAGS   := -std=c++17 -Wall -Wextra -O2
INCLUDES   := -Iinclude -Itests

#PKGS       := gtk+-3.0 opencv4
PKGS       := SimpleGtk
PKG_CFLAGS := $(shell pkg-config --cflags $(PKGS))
PKG_LIBS   := $(shell pkg-config --libs $(PKGS))
#LDFLAGS    := $(PKG_LIBS) -lmycustom
LDFLAGS    := $(PKG_LIBS)

SRCS       := src/image_tool.cpp tests/test_main.cpp
TARGET     := run_tests

.PHONY: all test clean

all: $(TARGET)

$(TARGET): $(SRCS)
	$(CXX) $(CXXFLAGS) $(INCLUDES) $(PKG_CFLAGS) $^ $(LDFLAGS) -o $@

test: $(TARGET)
	./$(TARGET)

clean:
	rm -f $(TARGET)

endif