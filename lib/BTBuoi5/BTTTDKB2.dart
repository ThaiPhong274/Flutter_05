import 'dart:io';

void main(){
  List<salesOrder> listSalesOrder = [];
  //Nhập vào thông tin đơn hàng của sản phẩm
  print('Nhập vào tên sản phẩm:');
  String tenSanPham = stdin.readLineSync()!;
  print('Nhập vào số lượng mua:');
  double soLuongMua = double.parse(stdin.readLineSync()!);
  print('Nhập vào đơn giá:');
  double donGia = double.parse(stdin.readLineSync()!);

  salesOrder od = salesOrder(tenSanPham, soLuongMua, donGia);
  listSalesOrder.add(od);

  //Thêm đơn hàng của sản phẩm thụ động
  salesOrder od1 = salesOrder('Dưa hấu', 15.6, 50000);
  listSalesOrder.add(od1);
  
  //Xuất ra thông tin đơn hàng
  getAllsalesOrder(listSalesOrder);
}

class salesOrder{
  String produceName;
  double quantity, unitPrice;
  salesOrder(this.produceName,this.quantity,this.unitPrice);
  void infoProduce(){
    print('===== THÔNG TIN SẢN PHẨM =====');
    print('Sản phẩm này là: $produceName được mua với số lượng: $quantity có đơn giá là: $unitPrice');
  }

  void tinhThanhTien(){
    //1.Tính thành tiền
    double totalAmount = quantity * unitPrice;
    
    //2. Áp dụng giảm giá:
    double discount = 0;
    if(totalAmount >= 1000000){
      discount = totalAmount * 0.1;
    }
    else if(totalAmount >= 500000){
      discount = totalAmount * 0.05;
    }
    else {
      discount = 0;
      }
    //thành tiền sau giảm giá
    double discountedAmount = totalAmount - discount;

    //Tính thuế VAT 8% trên tổng số tiền sau giảm giá.
    double vat = discountedAmount * 0.08;
    //Tổng thanh toán cuối cùng
    double finalTotalAmount = discountedAmount + vat;
    //In ra kết quả

  print('\n===== HÓA ĐƠN =====');
  print('Thành tiền: ${totalAmount.toStringAsFixed(0)}');
  print('Giảm giá: ${discount.toStringAsFixed(0)}');
  print('Sau giảm: ${discountedAmount.toStringAsFixed(0)}');
  print('VAT (8%): ${vat.toStringAsFixed(0)}');
  print('Thanh toán: ${finalTotalAmount.toStringAsFixed(0)}');
  }

}
  void getAllsalesOrder(List<salesOrder> listSalesOrder){
    for (var so in listSalesOrder){
      so.infoProduce();
      so.tinhThanhTien();
    }
  }

  