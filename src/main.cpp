#include <SimpleGtk>
#include "image_tool.hpp"

int main() {
    std::cout << "=== アプリケーション起動 ===" << std::endl;

    // 共通ロジックを呼び出す
    cv::Mat img = create_black_image(640, 480);
    std::cout << "画像を生成しました: " << img.cols << "x" << img.rows << std::endl;

    return 0;
}