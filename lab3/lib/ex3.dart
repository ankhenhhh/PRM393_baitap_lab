import 'dart:async';

void main() {
  print('\n--- Exercise 3 ---');

  // 1. Task bình thường (chạy ngay lập tức)
  print('1. Bắt đầu (Đồng bộ)');

  // 2. Future (Hàng đợi sự kiện - Event Queue)
  Future(() => print('4. Đây là Future (Event Queue)'));

  // 3. Microtask (Hàng đợi ưu tiên - Microtask Queue)
  scheduleMicrotask(() {
    print('3. Đây là Microtask (Ưu tiên chạy trước Future)');
  });

  // 4. Task đồng bộ cuối cùng
  print('2. Kết thúc (Đồng bộ)');

}