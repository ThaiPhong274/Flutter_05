import 'dart:io';

void main() {
  //Nhập thông tin nhân viên
  List<Nhanvien> dsNV = [];
  print('Nhập họ tên nhân viên:');
  String hoTenNv = stdin.readLineSync()!;

  print('Nhập số giờ làm việc:');
  double hoursWorked = double.parse(stdin.readLineSync()!);

  print('Nhập lương mỗi giờ:');
  double hourlyWage = double.parse(stdin.readLineSync()!);

  Nhanvien nv = Nhanvien(hoTenNv, hoursWorked, hourlyWage);
  dsNV.add(nv);

  //Thêm nhân viên thụ động
  Nhanvien nv1 = Nhanvien('Trần Văn B', 90, 125000);
  dsNV.add(nv1);

  getAllNhanVien(dsNV);
}

class Nhanvien {
  String hoTenNv;
  double hoursWorked,hourlyWage;
  Nhanvien(this.hoTenNv,this.hoursWorked,this.hourlyWage);
  void infoNhanVien(){
    print('\n===== THÔNG TIN NHÂN VIÊN =====');
    print('Nhan vien nay la $hoTenNv co gio lam viec la: $hoursWorked va co luong moi gio la: $hourlyWage');
  }

  void tinhGioLam(){
  // 1. Tính tổng lương cơ bản
  double totalSalary = hoursWorked * hourlyWage;

  // 2. Thêm phụ cấp nếu làm > 40 giờ
  if (hoursWorked > 40) {
    totalSalary += totalSalary * 0.2; // thêm 20%
  }

  // 3. Tính thuế
  double tax = 0;

  if (totalSalary > 10000000) {
    tax = totalSalary * 0.1;
  } else if (totalSalary >= 7000000) {
    tax = totalSalary * 0.05;
  } else {
    tax = 0;
  }

  // 4. Lương thực lãnh
  double netSalary = totalSalary - tax;

  //In ra kết quả
  print('\n===== KẾT QUẢ =====');
  print('Họ tên: $hoTenNv');
  print('Tổng lương trước thuế: ${totalSalary.toStringAsFixed(0)} VND');
  print('Thuế thu nhập: ${tax.toStringAsFixed(0)} VND');
  print('Lương thực lãnh: ${netSalary.toStringAsFixed(0)} VND');
  print('=========================');
}
}

void getAllNhanVien (List<Nhanvien> dsNV){
    for (var nv in dsNV){ 
      nv.infoNhanVien();
      nv.tinhGioLam();
    }
  }

