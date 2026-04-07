import 'dart:io';

// ===== MENU =====
void main() {
  while (true) {
    print("\n===== MENU =====");
    print("1. Thêm sản phẩm");
    print("2. Hiển thị giỏ hàng");
    print("3. Sửa sản phẩm");
    print("4. Xóa sản phẩm");
    print("5. Tính tổng tiền");
    print("0. Thoát");

    stdout.write("Chọn: ");
    int choice = int.tryParse(stdin.readLineSync()!) ?? -1;

    switch (choice) {
      case 1:
        addProduct();
        break;
      case 2:
        displayCart();
        break;
      case 3:
        editProduct();
        break;
      case 4:
        deleteProduct();
        break;
      case 5:
        calculateTotal();
        break;
      case 0:
        print("Thoát chương trình!");
        return;
      default:
        print("Lựa chọn không hợp lệ!");
    }
  }
}

// ===== CLASS SẢN PHẨM =====
class SanPham {
  String ten;
  int soLuong;
  double gia;

  SanPham(this.ten, this.soLuong, this.gia);

  double thanhTien() => soLuong * gia;

  Map<String, dynamic> toMap() {
    return {
      "ten": ten,
      "soLuong": soLuong,
      "gia": gia,
    };
  }

  factory SanPham.fromMap(Map<String, dynamic> map) {
    return SanPham(
      map['ten'],
      map['soLuong'],
      map['gia'],
    );
  }
}

// ===== GIỎ HÀNG =====
List<Map<String, dynamic>> cart = [];

// ===== INPUT AN TOÀN =====
int inputInt(String message) {
  int value;
  do {
    stdout.write(message);
    value = int.tryParse(stdin.readLineSync()!) ?? -1;
    if (value < 0) print("Không được nhập số âm!");
  } while (value < 0);
  return value;
}

double inputDouble(String message) {
  double value;
  do {
    stdout.write(message);
    value = double.tryParse(stdin.readLineSync()!) ?? -1;
    if (value < 0) print("Không được nhập số âm!");
  } while (value < 0);
  return value;
}

// ===== FORMAT TIỀN =====
String formatMoney(double money) {
  return money.toStringAsFixed(0).replaceAllMapped(
    RegExp(r'\B(?=(\d{3})+(?!\d))'),
    (match) => ',',
  );
}

// ===== THÊM =====
void addProduct() {
  stdout.write("Nhập tên sản phẩm: ");
  String ten = stdin.readLineSync()!;

  if (ten.trim().isEmpty) {
    print("Tên không được rỗng!");
    return;
  }

  int soLuong = inputInt("Nhập số lượng: ");
  double gia = inputDouble("Nhập giá: ");

  cart.add(SanPham(ten, soLuong, gia).toMap());
  print("Đã thêm sản phẩm!");
}

// ===== HIỂN THỊ =====
void displayCart() {
  if (cart.isEmpty) {
    print("Giỏ hàng trống!");
    return;
  }

  print("\n===== GIỎ HÀNG =====");
  for (int i = 0; i < cart.length; i++) {
    SanPham sp = SanPham.fromMap(cart[i]);

    print(
        "${i + 1}. ${sp.ten} | SL: ${sp.soLuong} | Giá: ${formatMoney(sp.gia)} | Thành tiền: ${formatMoney(sp.thanhTien())}");
  }
}

// ===== SỬA =====
void editProduct() {
  if (cart.isEmpty) {
    print("Giỏ hàng trống!");
    return;
  }

  displayCart();

  stdout.write("Chọn sản phẩm cần sửa: ");
  int index = int.tryParse(stdin.readLineSync()!) ?? -1;

  if (index < 1 || index > cart.length) {
    print("Không hợp lệ!");
    return;
  }

  SanPham sp = SanPham.fromMap(cart[index - 1]);

  stdout.write("Tên mới (${sp.ten}): ");
  String ten = stdin.readLineSync()!;

  int soLuong;
  do {
    stdout.write("Số lượng (${sp.soLuong}): ");
    String input = stdin.readLineSync()!;
    if (input.isEmpty) {
      soLuong = sp.soLuong;
      break;
    }
    soLuong = int.tryParse(input) ?? -1;
    if (soLuong < 0) print("Không được âm!");
  } while (soLuong < 0);

  double gia;
  do {
    stdout.write("Giá (${sp.gia}): ");
    String input = stdin.readLineSync()!;
    if (input.isEmpty) {
      gia = sp.gia;
      break;
    }
    gia = double.tryParse(input) ?? -1;
    if (gia < 0) print("Không được âm!");
  } while (gia < 0);

  sp.ten = ten.isEmpty ? sp.ten : ten;
  sp.soLuong = soLuong;
  sp.gia = gia;

  cart[index - 1] = sp.toMap();

  print("✔️ Đã cập nhật!");
}

// ===== XÓA =====
void deleteProduct() {
  if (cart.isEmpty) {
    print("Giỏ hàng trống!");
    return;
  }

  displayCart();

  stdout.write("Chọn sản phẩm cần xóa: ");
  int index = int.tryParse(stdin.readLineSync()!) ?? -1;

  if (index < 1 || index > cart.length) {
    print("Không hợp lệ!");
    return;
  }

  cart.removeAt(index - 1);
  print("Đã xóa!");
}

// ===== TỔNG TIỀN =====
void calculateTotal() {
  if (cart.isEmpty) {
    print("Giỏ hàng trống!");
    return;
  }

  double total = 0;
  for (var item in cart) {
    total += SanPham.fromMap(item).thanhTien();
  }

  print("Tổng tiền: ${formatMoney(total)}");
}

