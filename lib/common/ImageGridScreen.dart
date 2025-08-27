import 'package:flutter/material.dart';

class ImageGridScreen extends StatelessWidget {
  // Danh sách ảnh (có thể là asset hoặc network images)
  final List<String> imageUrls = [
    'assets/images/1.jpg',
    'assets/images/6.jpg',
    'assets/images/7.jpg',
    'assets/images/8.jpg',
    'assets/images/9.jpg',
    'assets/images/6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: GridView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 cột
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.0, // Tỷ lệ vuông
          ),
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Hiển thị ảnh
                Expanded(
                  child: Image.asset(
                    imageUrls[index],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback khi không load được ảnh
                      return Icon(Icons.image, size: 40);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
