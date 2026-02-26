import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MovieHome(),
  ));
}

class MovieHome extends StatelessWidget {
  const MovieHome({super.key});

  @override
  Widget build(BuildContext context) {
    // Danh sách dữ liệu mẫu
    final List<String> items = ["Avatar", "Inception", "Interstellar", "Joker"];

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text("Exercise 3 – Layout De..."),
      ),
      // Bước 1: Dùng Column để tạo các phần theo chiều dọc
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bước 2: Dùng Padding 16px để tạo khoảng cách cho tiêu đề
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Now Playing",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          // Bước 2: Dùng SizedBox 12px để tạo khoảng trống giữa các phần
          const SizedBox(height: 12),

          // Bước 3: Dùng ListView.builder để hiển thị danh sách phim
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                // Bước 4: Áp dụng khoảng cách 8px và 16px đồng nhất
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      // Row (Hàng) bên trong ListTile để xếp Icon và Chữ
                      leading: CircleAvatar(child: Text(items[index][0])),
                      title: Text(items[index]),
                      subtitle: const Text("Sample description"),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}