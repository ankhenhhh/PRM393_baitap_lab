import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 1. Dùng StatefulWidget
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Biến lưu trạng thái Chế độ tối (true là tối, false là sáng)
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //  Nếu _isDarkMode là true thì dùng màu tối, ngược lại
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        // --- PHẦN 1: APPBAR (Thanh tiêu đề) ---
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back),
          title: const Text("Exercise 4 – App Str..."),
        ),

        // --- PHẦN 2: BODY
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Hàng trên cùng chứa tiêu đề và nút gạt Switch
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Exercise 4 – App Str...", style: TextStyle(fontSize: 16)),
                  Row(
                    children: [
                      const Text("Dark"),
                      Switch(
                        value: _isDarkMode,
                        onChanged: (value) {
                          // Cập nhật trạng thái và vẽ lại giao diện
                          setState(() {
                            _isDarkMode = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              const Center(
                child: Text(
                  "This is a simple screen with theme toggle.",
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 100), // Tạo khoảng trống dưới cùng
            ],
          ),
        ),

      ),
    );
  }
}