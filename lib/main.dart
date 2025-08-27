import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_shop_dan/ImageCarousel.dart';
import 'package:web_shop_dan/common/ImageGridScreen.dart';
import 'package:web_shop_dan/common/formauth.dart';
import 'package:web_shop_dan/hero.dart';

void main() {
  runApp(const MusicStoreApp());
}

class MusicStoreApp extends StatelessWidget {
  const MusicStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        textTheme: ThemeData.dark().textTheme.apply(fontFamily: "Inter"),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            HeroSection(),
            SizedBox(height: 100),
            AboutSection(),
            BlogSection(),
            Parameter(),
            SizedBox(height: 100),
            ImageCarousel(),
            SizedBox(height: 50),
            Slution(),
            Follow(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

/// ---------------- HEADER ----------------
class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 50),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "🎵 Music",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                "Store",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ],
          ),
          const Spacer(),
          _buildMenuItem("Trang chủ"),
          _buildMenuItem("Blog"),
          _buildMenuItem("Cửa hàng"),
          _buildMenuItem("Liên hệ"),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: InkWell(
        onTap: () {},
        child: Text(
          text,
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
    );
  }
}

/// ---------------- ABOUT ----------------
class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1200,
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 100),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/3.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(40),
            color: Colors.black.withOpacity(0.5),
            height: 700,
            width: 600,
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "About Me",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 30),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [Color(0xFFA78BFA), Color(0xFF3B82F6)],
                          ),
                        ),
                        child: const Center(
                          child: Text("🎸", style: TextStyle(fontSize: 30)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Xin chào! Tôi là Mạnh, một người yêu âm nhạc ",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 8,
                    children: [
                      _buildChip("Guitar", Colors.purple),
                      _buildChip("Piano", Colors.blue),
                      _buildChip("Ukulele", Colors.green),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 40),
        ],
      ),
    );
  }

  Widget _buildChip(String label, Color color) {
    return Chip(
      backgroundColor: color.withOpacity(0.2),
      label: Text(label, style: TextStyle(color: color)),
    );
  }
}

/// ---------------- BLOG ----------------
class BlogSection extends StatelessWidget {
  const BlogSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Column(
        children: [
          const Text(
            "Bài viết mới nhất",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 40),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: [
              _buildBlogCard(
                "🎼",
                Colors.pink,
                "Cách chọn guitar đầu tiên cho người mới bắt đầu",
                "Hướng dẫn chi tiết giúp bạn chọn được cây guitar phù hợp...",
                "15/12/2024",
              ),
              _buildBlogCard(
                "🎹",
                Colors.blue,
                "5 bài hát piano dễ cho người mới học",
                "Danh sách những bài hát piano đơn giản nhưng hay ho...",
                "12/12/2024",
              ),
              _buildBlogCard(
                "🎵",
                Colors.green,
                "Bảo quản nhạc cụ trong mùa mưa",
                "Những lưu ý quan trọng để bảo vệ nhạc cụ...",
                "10/12/2024",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBlogCard(
    String emoji,
    Color color,
    String title,
    String desc,
    String date,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [color.withOpacity(0.8), color.withOpacity(0.5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Text(emoji, style: const TextStyle(fontSize: 40)),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.black.withOpacity(0.7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  desc,
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white54,
                      ),
                    ),
                    const Text(
                      "Đọc thêm →",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Parameter extends StatelessWidget {
  const Parameter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(200),
      child: Column(
        children: [
          Text(
            "Some of the Results I'm Proud of",
            style: TextStyle(
              fontSize: 50,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    '45',
                    style: TextStyle(
                      fontSize: 50,
                      color: const Color.fromARGB(255, 69, 117, 15),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '---',
                    style: TextStyle(
                      fontSize: 50,
                      color: const Color.fromARGB(255, 69, 117, 15),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "countries visited",
                    style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '150',
                    style: TextStyle(
                      fontSize: 50,
                      color: const Color.fromARGB(255, 69, 117, 15),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '---',
                    style: TextStyle(
                      fontSize: 50,
                      color: const Color.fromARGB(255, 69, 117, 15),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "cities visited",
                    style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '90 000+',
                    style: TextStyle(
                      fontSize: 50,
                      color: const Color.fromARGB(255, 69, 117, 15),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '---',
                    style: TextStyle(
                      fontSize: 50,
                      color: const Color.fromARGB(255, 69, 117, 15),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "photos taken",
                    style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '394',
                    style: TextStyle(
                      fontSize: 50,
                      color: const Color.fromARGB(255, 69, 117, 15),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '---',
                    style: TextStyle(
                      fontSize: 50,
                      color: const Color.fromARGB(255, 69, 117, 15),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "blog articles",
                    style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 50),
          Text(
            "Latest Stories",
            style: TextStyle(
              fontSize: 50,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '---',
            style: TextStyle(
              fontSize: 50,
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 1000,
                width: 700,
                color: Colors.amber,
                child: Text("đâsdas"),
              ),
              Container(
                height: 1000,
                width: 700,
                color: Colors.red,
                child: Text("đâsdas"),
              ),
            ],
          ),
          SizedBox(height: 50),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadiusGeometry.zero,
              ),
              backgroundColor: Colors.green[800],
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            ),
            onPressed: () {},
            child: const Text(
              "READ MORE",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class Slution extends StatelessWidget {
  const Slution({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(150),
      color: Colors.grey[300],
      height: 500,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(width: 2, height: 120, color: Colors.black),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.format_quote, size: 40, color: Colors.green),
                const SizedBox(height: 10),
                const Text(
                  "Because in the end, you won’t remember the time you spent "
                  "working in the office or mowing your lawn. Climb that "
                  "goddamn mountain.",
                  style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Jack Kerouac",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Follow extends StatelessWidget {
  const Follow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // full ngang
      height: 3540,
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 100),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/11.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Text(
            "Some of the Results I'm Proud of",
            style: TextStyle(
              fontSize: 50,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 50),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 700,
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/5.jpg"),
                    SizedBox(height: 30),
                    Text("17 Dec 2019"),
                    SizedBox(height: 12),
                    Text(
                      "Vienna, the Emperor's Pearl",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'ádasdhasjdhajsdhjsadhjashdjasdhasjdhjashdjashdjhasjdhasgdasdjasgdahsdgadjgjasdgajsdgasj',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(Icons.circle),
                        SizedBox(width: 10),
                        Text('Jack'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 700,
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/6.jpg"),
                    SizedBox(height: 30),
                    Text("17 Dec 2019"),
                    SizedBox(height: 12),
                    Text(
                      "Vienna, the Emperor's Pearl",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'ádasdhasjdhajsdhjsadhjashdjasdhasjdhjashdjashdjhasjdhasgdasdjasgdahsdgadjgjasdgajsdgasj',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(Icons.circle),
                        SizedBox(width: 10),
                        Text('Jack'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 700,
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/7.jpg"),
                    SizedBox(height: 30),
                    Text("17 Dec 2019"),
                    SizedBox(height: 12),
                    Text(
                      "Vienna, the Emperor's Pearl",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'ádasdhasjdhajsdhjsadhjashdjasdhasjdhjashdjashdjhasjdhasgdasdjasgdahsdgadjgjasdgajsdgasj',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(Icons.circle),
                        SizedBox(width: 10),
                        Text('Jack'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 100),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadiusGeometry.zero,
              ),
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            ),
            onPressed: () {},
            child: const Text("READ ME"),
          ),
          SizedBox(height: 100),
          Text(
            "FOLLOW ME",
            style: TextStyle(
              color: Colors.black,
              fontSize: 35,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 20),
          Container(height: 2, width: 150, color: Colors.black),
          SizedBox(height: 30),
          Text(
            "Join me in social media and stay tuned!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w100,
            ),
          ),
          SizedBox(height: 150),
          ImageGridScreen(),
          SizedBox(height: 50),
          AskMeAnythingScreen(),
        ],
      ),
    );
  }
}

/// ---------------- FOOTER ----------------
class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0F172A),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Text(
              "🎵 Music Store\nChia sẻ đam mê âm nhạc, kết nối yêu thương qua từng giai điệu.",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Danh mục", style: TextStyle(color: Colors.white)),
                SizedBox(height: 8),
                Text(
                  "Guitar\nPiano\nUkulele\nPhụ kiện",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Hỗ trợ", style: TextStyle(color: Colors.white)),
                SizedBox(height: 8),
                Text(
                  "Hướng dẫn mua hàng\nChính sách bảo hành\nĐổi trả\nFAQ",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Liên hệ", style: TextStyle(color: Colors.white)),
                SizedBox(height: 8),
                Text(
                  "📞 0123 456 789\n✉️ minh@musicstore.com\n🏠 123 Đường Âm Nhạc, Q1, HCM",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
