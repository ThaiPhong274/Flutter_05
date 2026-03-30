import 'dart:io';

void main() {
  List<Product> productList = [];

  int choice;

  do {
    print('\n===== MENU =====');
    print('1. Thêm sản phẩm');
    print('2. Hiển thị danh sách');
    print('3. Tìm sản phẩm theo tên');
    print('4. Bán sản phẩm');
    print('0. Thoát');

    choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        addProduct(productList);
        break;
      case 2:
        showProducts(productList);
        break;
      case 3:
        searchProduct(productList);
        break;
      case 4:
        sellProduct(productList);
        break;
      case 0:
        print('Thoát chương trình!');
        break;
      default:
        print('Lựa chọn không hợp lệ!');
    }
  } while (choice != 0);
}

// ===== CLASS =====
class Product {
  String productName;
  double price;
  int quantity;

  Product(this.productName, this.price, this.quantity);

  void display() {
    print('Tên: $productName | Giá: $price | Tồn kho: $quantity');
  }
}

// ===== CHỨC NĂNG =====

// Thêm sản phẩm
void addProduct(List<Product> list) {
  print('Nhập tên sản phẩm:');
  String name = stdin.readLineSync()!;

  print('Nhập giá tiền:');
  double price = double.parse(stdin.readLineSync()!);

  print('Nhập số lượng:');
  int quantity = int.parse(stdin.readLineSync()!);

  list.add(Product(name, price, quantity));
  print('Đã thêm sản phẩm!');
}

// Hiển thị danh sách
void showProducts(List<Product> list) {
  if (list.isEmpty) {
    print('Danh sách trống!');
    return;
  }

  print('\n===== DANH SÁCH SẢN PHẨM =====');
  for (var p in list) {
    p.display();
  }
}

// Tìm sản phẩm theo tên
void searchProduct(List<Product> list) {
  print('Nhập tên sản phẩm cần tìm:');
  String keyword = stdin.readLineSync()!;

  bool found = false;

  for (var p in list) {
    if (p.productName.toLowerCase().contains(keyword.toLowerCase())) {
      p.display();
      found = true;
    }
  }

  if (!found) {
    print('Không tìm thấy sản phẩm!');
  }
}

// Bán sản phẩm
void sellProduct(List<Product> list) {
  print('Nhập tên sản phẩm cần bán:');
  String name = stdin.readLineSync()!;

  for (var p in list) {
    if (p.productName.toLowerCase() == name.toLowerCase()) {
      print('Nhập số lượng cần bán:');
      int sellQty = int.parse(stdin.readLineSync()!);

      if (sellQty <= p.quantity) {
        p.quantity -= sellQty;
        double total = sellQty * p.price;

        print('Bán thành công!');
        print('Thành tiền: ${total.toStringAsFixed(2)}');
      } else {
        print('Không đủ hàng trong kho!');
      }
      return;
    }
  }

  print('Không tìm thấy sản phẩm!');
}