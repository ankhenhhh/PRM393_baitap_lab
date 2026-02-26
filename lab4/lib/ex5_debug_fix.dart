import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DebugFixDemo(),
  ));
}

class DebugFixDemo extends StatefulWidget {
  const DebugFixDemo({super.key});

  @override
  State<DebugFixDemo> createState() => _DebugFixDemoState();
}

class _DebugFixDemoState extends State<DebugFixDemo> {
  // Biến dùng để minh họa lỗi setState
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercise 5 – Common U..."),
      ),
      // 1. FIX OVERFLOW: Dùng SingleChildScrollView để tránh lỗi tràn màn hình khi nội dung dài
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Correct ListView inside Column using Expanded",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // 2. FIX LISTVIEW TRONG COLUMN:
              // Phải bọc ListView vào Container có chiều cao cố định hoặc dùng Expanded
              // (dùng SizedBox để giới hạn chiều cao trong một danh sách cuộn lớn)
              SizedBox(
                height: 250,
                child: ListView(
                  children: const [
                    ListTile(leading: Icon(Icons.movie), title: Text("Movie A")),
                    ListTile(leading: Icon(Icons.movie), title: Text("Movie B")),
                    ListTile(leading: Icon(Icons.movie), title: Text("Movie C")),
                    ListTile(leading: Icon(Icons.movie), title: Text("Movie D")),
                  ],
                ),
              ),

              const Divider(height: 40),

              // 3. FIX STATE UPDATE: Nút bấm phải có setState mới thay đổi số trên màn hình
              Text("Counter: $_counter", style: const TextStyle(fontSize: 20)),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _counter++; // Phải nằm trong setState để giao diện vẽ lại
                  });
                },
                child: const Text("Increase Counter (Fix setState)"),
              ),

              const SizedBox(height: 20),

              // 4. FIX DATEPICKER CONTEXT: Gọi DatePicker đúng cách từ một nút bấm
              ElevatedButton(
                onPressed: () {
                  showDatePicker(
                    context: context, // Dùng context của Widget hiện tại
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                },
                child: const Text("Open Date Picker (Fix Context)"),
              ),

              // minh họa việc SingleChildScrollView hoạt động
              const SizedBox(height: 400, child: Center(child: Text("Scroll up to see more"))),
            ],
          ),
        ),
      ),
    );
  }
}