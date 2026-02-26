import 'dart:async';

// 1. Định nghĩa lớp Product
class Product {
  final String id;
  final String name;
  final double price;

  Product({required this.id, required this.name, required this.price});

  @override
  String toString() => 'Product($id, $name, \$${price})';
}

// 2. Lớp quản lý dữ liệu sản phẩm
class ProductRepository {
  // Bộ điều khiển Stream để phát dữ liệu thời gian thực
  final _controller = StreamController<Product>.broadcast();

  // Trả về danh sách cố định sau 1 giây (Future)
  Future<List<Product>> getAll() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      Product(id: '1', name: 'Laptop', price: 999),
      Product(id: '2', name: 'Phone', price: 499),
    ];
  }

  // Luồng dữ liệu cho các sản phẩm mới thêm vào (Stream)
  Stream<Product> liveAdded() => _controller.stream;

  // Hàm giả lập thêm sản phẩm mới
  void addProduct(Product p) {
    _controller.add(p);
  }
}

void main() async {
  print('--- Exercise 1 ---');
  var repo = ProductRepository();

  // Nghe Stream trước để không bỏ lỡ dữ liệu
  repo.liveAdded().listen((p) => print('Stream nhận sản phẩm mới: $p'));

  // Lấy toàn bộ danh sách hiện có
  var products = await repo.getAll();
  print('Future trả về danh sách: $products');

  // Giả lập thêm sản phẩm mới sau 2 giây
  await Future.delayed(Duration(seconds: 2));
  repo.addProduct(Product(id: '3', name: 'Mouse', price: 25));
}