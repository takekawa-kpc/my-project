#include "image_tool.hpp"
//#include <mycustom/mycustom.h> // 自作 .deb から提供されるヘッダー

cv::Mat create_black_image(int width, int height) {
    // 自作ライブラリの処理を呼び出し
    //mycustom_init();

    // OpenCV による画像データ生成
    return cv::Mat::zeros(height, width, CV_8UC3);
}