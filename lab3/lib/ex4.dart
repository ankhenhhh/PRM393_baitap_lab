void main() async {
  print('\n--- Exercise 4 ---');

  // Tạo một stream phát các số từ 1 đến 5
  Stream<int> numbers = Stream.fromIterable([1, 2, 3, 4, 5]);

  print('Đang xử lý Stream...');

  numbers
      .map((n) => n * n)         // Bình phương số: 1, 4, 9, 16, 25
      .where((n) => n % 2 == 0)  // Chỉ lấy số chẵn: 4, 16
      .listen((result) {
    print('Kết quả sau biến đổi và lọc: $result');
  });
}