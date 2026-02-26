class Settings {
  static Settings? _instance; // Biến lưu trữ đối tượng duy nhất

  // 1. Private Constructor: Ngăn không cho bên ngoài dùng từ khóa 'new'
  Settings._internal();

  // 2. Factory Constructor: Kiểm tra, nếu chưa có thì tạo mới, có rồi thì trả về cái cũ
  factory Settings() {
    _instance ??= Settings._internal();
    return _instance!;
  }

  void log() => print('Cài đặt đang hoạt động');
}

void main() {
  print('\n--- Exercise 5 ---');

  var s1 = Settings();
  var s2 = Settings();

  print('Kiểm tra s1 và s2 có phải là một: ${identical(s1, s2)}'); // Kết quả: true

  if (identical(s1, s2)) {
    print('Thành công: Đây là Singleton Pattern (Chỉ có 1 vùng nhớ).');
  }
}