import 'dart:async';

Future<void> main() async {
  print("Exercise 1: Product Model & Repository");

  final repo = ProductRepository();

  // Future: getAll()
  List<Product> products = await repo.getAll();
  print("Initial products:");
  for (var p in products) {
    print(" $p");
  }

  // Stream: listen live added
  repo.liveAdded().listen((p) {
    print("LIVE UPDATE -> $p");
  });

  // Simulate adding products
  await Future.delayed(Duration(milliseconds: 300));
  repo.addProduct(Product(3, "Tablet", 500.0));

  await Future.delayed(Duration(milliseconds: 300));
  repo.addProduct(Product(4, "Headphone", 150.0));

  await Future.delayed(Duration(milliseconds: 300));
  repo.dispose();
}

// Product model
class Product {
  final int id;
  final String name;
  final double price;

  Product(this.id, this.name, this.price);

  @override
  String toString() => "Product(id: $id, name: $name, price: $price)";
}

// Repository
class ProductRepository {
  final List<Product> _products = [
    Product(1, "Laptop", 1200.0),
    Product(2, "Phone", 800.0),
  ];

  final _controller = StreamController<Product>.broadcast();

  Future<List<Product>> getAll() async {
    await Future.delayed(Duration(milliseconds: 500));
    return _products;
  }

  Stream<Product> liveAdded() => _controller.stream;

  void addProduct(Product p) {
    _products.add(p);
    _controller.add(p);
  }

  void dispose() {
    _controller.close();
  }
}
