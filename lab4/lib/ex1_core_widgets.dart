import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: CoreWidgetsDemo(),
  ));
}

class CoreWidgetsDemo extends StatelessWidget {
  const CoreWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Thanh ứng dụng (AppBar)
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back), // Biểu tượng mũi tên quay lại
        title: const Text("Exercise 1 – Core Widge..."),
      ),

      // 2. Thân chương trình (Body)
      body: SingleChildScrollView( // Cho phép cuộn trang nếu nội dung quá dài
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Tạo khoảng cách với mép màn hình
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Căn lề trái cho các thành phần
            children: [
              // --- TIÊU ĐỀ (Headline Text) ---
              const Text(
                "Welcome to Flutter UI",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20), // Tạo khoảng trống 20px

              // --- BIỂU TƯỢNG (Icon) ---
              const Center(
                child: Icon(
                  Icons.movie_creation_outlined, // Biểu tượng cuộn phim
                  size: 100,
                  color: Colors.blue, // Màu xanh như trong hình mẫu
                ),
              ),
              const SizedBox(height: 20),

              // --- HÌNH ẢNH (Image.network) ---
              ClipRRect(
                borderRadius: BorderRadius.circular(8), // Bo góc cho ảnh
                child: Image.network(
                  'https://picsum.photos/400/250',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover, // Ảnh lấp đầy khung hình
                ),
              ),
              const SizedBox(height: 20),

              // --- THẺ CARD VÀ LISTTILE ---
              Card(
                color: Colors.grey[100], // Màu nền xám nhạt của Card
                elevation: 2, // Đổ bóng nhẹ
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Bo góc Card
                ),
                child: const ListTile(
                  leading: Icon(Icons.star, color: Colors.black54), // Icon ngôi sao bên trái
                  title: Text(
                    "Movie Item",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("This is a sample ListTile inside a Card."),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}