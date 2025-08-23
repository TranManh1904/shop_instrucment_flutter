import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        scaffoldBackgroundColor: const Color(0xFF111827),
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
          children: const [
            Header(),
            HeroSection(),
            AboutSection(),
            BlogSection(),
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
      color: const Color(0xFF000000),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Row(
        children: [
          const Text(
            "🎵 Music Store",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white70, fontSize: 16),
      ),
    );
  }
}

/// ---------------- HERO ----------------
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          const Text(
            "Đam mê âm nhạc, chia sẻ yêu thương",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          const Text(
            "Chào mừng đến với thế giới nhạc cụ! Tôi là Minh, người yêu âm nhạc và muốn chia sẻ niềm đam mê này với mọi người.",
            style: TextStyle(color: Colors.white70, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                ),
                onPressed: () {},
                child: const Text("Đọc Blog"),
              ),
              const SizedBox(width: 16),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white, width: 2),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                child: const Text("Xem Sản phẩm"),
              ),
            ],
          ),
        ],
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
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      color: const Color(0xFF111827),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Về tôi",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Xin chào! Tôi là Minh, một người yêu âm nhạc với hơn 10 năm kinh nghiệm chơi guitar và piano...",
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
          const SizedBox(width: 40),
          Container(
            width: 160,
            height: 160,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFFA78BFA), Color(0xFF3B82F6)],
              ),
            ),
            child: const Center(
              child: Text("🎸", style: TextStyle(fontSize: 60)),
            ),
          ),
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
      color: const Color(0xFF1F2937),
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
