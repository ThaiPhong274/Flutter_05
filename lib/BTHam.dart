import 'dart:io';

import 'package:flutter_application_1/Bank_account.dart';

void main() {
  // var newAcc = BankAccout(001, 'Nguyen', 500000);
  // print(newAcc.checkBalance);
  // newAcc.withdraw(10000);
  // print(newAcc.checkBalance);

  List<Hocsinh> lisths = [];
  Hocsinh HocsinhA = Hocsinh('123','Hoa',18,22);
  lisths.add(HocsinhA);
  getAllHocsinh(lisths);
}























//Du lieu BT1

//BT1
// List<Hocsinh> lisths = [];
//Cach1
//     while (true) {
//         print('\n===== QUẢN LÝ SINH VIÊN =====');
//         print('1. Thêm sinh viên');
//         print('2. Hiển thị danh sách');
//         print('3. Tìm sinh viên theo ID');
//         print('0. Thoát');
//     int choice = int.parse(stdin.readLineSync()!);
//     switch (choice) {
//       case 1:
//         Hocsinh st = Hocsinh();
//         st.input();
//         lisths.add(st);
//         break;
//       case 2:
//         for (var st in lisths) {
//           st.display();
//         }
//         break;
//       case 3:
//         print('Nhập ID cần tìm:');
//         String searchId = stdin.readLineSync()!;
//         for (var st in lisths) {
//           if (st.id == searchId) {
//             st.display();
//           }
//         }
//         break;
//       case 0:
//         return;
//       default:
//         print('Lựa chọn không hợp lệ');
//     }
//   }
//Cach 1
// class Hocsinh{
//   String id = '';
//   String tenhs = '';
//   int age = 0;
//   double grade = 0;
//   void input(){
//     print('Nhap vao id hoc sinh: ');
//     id = stdin.readLineSync()!;
//     print('Nhap vao ho ten hoc sinh: ');
//     tenhs = stdin.readLineSync()!;
//     print('Nhap vao tuoi hoc sinh: ');
//     age = int.parse(stdin.readLineSync()!);
//     print('Nhap vao diem trung binh: ');
//     grade = double.parse(stdin.readLineSync()!);    
//   }
//   void display(){
//     print('ID hoc sinh: $id');
//     print('Ho ten hoc sinh: $tenhs');
//     print('Tuoi hoc sinh: $age');
//     print('Diem trung binh: $grade');
//   }
// }

//Cach 2


class Hocsinh{
  String id,tenhs;
  int age,grade;
  Hocsinh(this.id,this.tenhs,this.age,this.grade);
  void introduce(){
    print('Sinh vien co ten la $tenhs dang hoc lop $grade');
  }
}
void getAllHocsinh(List<Hocsinh> hs){
  for (var hs in hs){
 (hs.introduce());
 }
  }

Hocsinh? findHocsinhById(List<Hocsinh> hs,String id){
  for (var hs in hs){
    if(hs.id == id){
      return hs;
    }
  }
  return null;
}












































// final a = 5 + 3;
// final b = total(5, 4);
// final c = totalA(10, 11);
// final d = totalB(20, 11);
// final e = totalB(11, 20);
// final f = await fetchData();
//   print(a);
//   print(b);
//   print(c);
//   print(d);
//   print(e);
//   print(f);

//   log('xin chao');

// int total(int a, int b){
//   return a + b;
// }
// int totalA(int a, int b) => a + b;
// int totalB(int a, int b) => (a > b) ? a - b : a + b;
// void log(String value){
//   print('Ham Log $value');
// }

// Future<String> fetchData() async{
//   await Future.delayed(Duration(seconds: 2));
//   return 'Data loaded';
// }

// print(IsPrime(3)); 

// bool IsPrime(int n){
//   if (n < 2) return false;
//   for (int i = 2; i < n; i++){
//     if (n % i == 0){
//       return false;
//     }
//   }
//   return true;
// }