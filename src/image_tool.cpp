#include "image_tool.hpp"

cv::Mat create_black_image(int width, int height) {
    // OpenCV による画像データ生成
    return cv::Mat::zeros(height, width, CV_8UC3);
}