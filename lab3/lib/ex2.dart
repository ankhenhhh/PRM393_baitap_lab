class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  // Constructor đặc biệt để tạo User từ Map (JSON)
  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  @override
  String toString() => 'User(Name: $name, Email: $email)';
}

Future<List<User>> fetchUsers() async {
  // Giả lập dữ liệu nhận được từ API (JSON String thực tế sẽ được decode thành List<Map>)
  var jsonResponse = [
    {'name': 'Nguyễn Văn A', 'email': 'ana@gmail.com'},
    {'name': 'Trần Thị B', 'email': 'bttran@gmail.com'},
  ];

  await Future.delayed(Duration(seconds: 1));
  // Chuyển đổi từng Map trong List thành đối tượng User
  return jsonResponse.map((item) => User.fromJson(item)).toList();
}

void main() async {
  print('\n--- Exercise 2 ---');
  print('Đang tải danh sách người dùng...');
  var users = await fetchUsers();
  users.forEach((u) => print(u));
}