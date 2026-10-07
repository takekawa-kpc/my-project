#include "doctest.h"
#include "image_tool.hpp"

TEST_CASE("Issue #03: 巨大な画像サイズを指定した時のテスト") {
    cv::Mat img = create_black_image(4000, 3000);
    CHECK(img.cols == 4000);
    CHECK(img.rows == 3000);
}