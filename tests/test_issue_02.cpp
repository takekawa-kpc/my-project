#include "doctest.h"
#include "image_tool.hpp"

TEST_CASE("Issue #02: ゼロサイズの画像を指定した時の境界値テスト") {
    // 例: 幅・高さが 0 でもクラッシュしないか検証
    cv::Mat img = create_black_image(0, 0);
    CHECK(img.empty() == true);
}