#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN
#include "doctest.h"
#include "image_tool.hpp"

TEST_CASE("OpenCV 画像生成処理のテスト") {
    cv::Mat img = create_black_image(100, 50);

    // サイズやチャンネル数の期待値を検証
    CHECK(img.cols == 100);
    CHECK(img.rows == 50);
    CHECK(img.channels() == 3);
}