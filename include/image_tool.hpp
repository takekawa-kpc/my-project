#pragma once
#include <opencv2/opencv.hpp>
#include <gtk/gtk.h>

// 黒い画像を生成する関数の宣言
cv::Mat create_black_image(int width, int height);
