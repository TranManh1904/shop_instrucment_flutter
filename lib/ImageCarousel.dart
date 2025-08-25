import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> images = [
    "assets/images/4.jpg",
    "assets/images/5.jpg",
    "assets/images/6.jpg",
    "assets/images/7.jpg",
    "assets/images/8.jpg",
    "assets/images/9.jpg",
    "assets/images/10.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 700,
        autoPlay: true, // tự động chạy
        enlargeCenterPage: true, // ảnh ở giữa to hơn
        viewportFraction: 0.3, // tỷ lệ chiếm màn hình
        aspectRatio: 16 / 9,
        autoPlayInterval: Duration(seconds: 3),
      ),
      items: images
          .map(
            (item) => Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(item),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
