import 'package:flutter/material.dart';

/// ---------------- HERO ----------------
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // chỉnh vị trí
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(50),
            height: 700,
            width: 700,
            child: Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "HI! I'm Manh the Intruction",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  const Text(
                    "Đam mê âm nhạc, chia sẻ yêu thương",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadiusGeometry.zero,
                          ),
                          backgroundColor: Colors.green[800],
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 25,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text("Đọc Blog"),
                      ),
                      const SizedBox(width: 16),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadiusGeometry.zero,
                          ),
                          side: const BorderSide(color: Colors.white, width: 2),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 25,
                          ),
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () {},
                        child: const Text("Xem Sản phẩm"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 50),
          Stack(
            clipBehavior: Clip.none, // cho phép phần tử đè ra ngoài
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: 1000,
                height: 500,
                child: Expanded(
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/2.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -250,
                left: 100,
                child: Container(
                  width: 400,
                  height: 500,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: ClipRRect(
                      child: Image.asset(
                        "assets/images/1.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
