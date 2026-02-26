import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: InputControlsDemo(),
    debugShowCheckedModeBanner: false, // Tắt nhãn "Debug" ở góc màn hình
  ));
}

// 1. Dùng StatefulWidget vì giao diện cần thay đổi khi ta tương tác
class InputControlsDemo extends StatefulWidget {
  @override
  _InputControlsDemoState createState() => _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo> {
  // --- CÁC BIẾN LƯU TRỮ GIÁ TRỊ (STATE) ---
  double _sliderValue = 50;          // Giá trị của thanh trượt
  bool _isMovieActive = false;      // Trạng thái bật/tắt của Switch
  String _selectedGenre = "None";    // Thể loại phim được chọn
  DateTime? _selectedDate;           // Ngày được chọn từ DatePicker

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("Exercise 2 – Input Contr..."),
      ),
      // Dùng SingleChildScrollView để tránh lỗi nếu màn hình điện thoại nhỏ
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Căn lề trái toàn bộ
          children: [
            // --- PHẦN 1: SLIDER (THANH TRƯỢT) ---
            Text("Rating (Slider)", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Slider(
              value: _sliderValue,
              min: 0,
              max: 100,
              onChanged: (value) {
                setState(() { _sliderValue = value; }); // Cập nhật và vẽ lại màn hình
              },
            ),
            Text("Current value: ${_sliderValue.toInt()}"),
            SizedBox(height: 20),

            // --- PHẦN 2: SWITCH (NÚT BẬT/TẮT) ---
            Text("Active (Switch)", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SwitchListTile(
              title: Text("Is movie active?"),
              value: _isMovieActive,
              onChanged: (value) {
                setState(() { _isMovieActive = value; });
              },
            ),
            SizedBox(height: 20),

            // --- PHẦN 3: RADIOLISTTILE (CHỌN MỘT TRONG NHIỀU) ---
            Text("Genre (RadioListTile)", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            RadioListTile(
              title: Text("Action"),
              value: "Action",
              groupValue: _selectedGenre, // Nhóm các Radio lại với nhau
              onChanged: (value) {
                setState(() { _selectedGenre = value.toString(); });
              },
            ),
            RadioListTile(
              title: Text("Comedy"),
              value: "Comedy",
              groupValue: _selectedGenre,
              onChanged: (value) {
                setState(() { _selectedGenre = value.toString(); });
              },
            ),
            Text("Selected genre: $_selectedGenre"),
            SizedBox(height: 20),

            // --- PHẦN 4: DATE PICKER (CHỌN NGÀY) ---
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      // Hiện bảng chọn ngày
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2030),
                      );
                      // Nếu người dùng chọn ngày (không bấm Cancel)
                      if (picked != null) {
                        setState(() { _selectedDate = picked; });
                      }
                    },
                    child: Text("Open Date Picker"),
                  ),
                  // Hiển thị ngày đã chọn nếu có
                  if (_selectedDate != null)
                    Text("Selected Date: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}