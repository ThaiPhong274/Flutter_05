import 'dart:io';
import 'dart:math';

void main() {
  // //bai toan tinh CV dien tich hinh chu nhat
  // var cd = 5;
  // var cr = 8;
  // final dtHV = cd*cr;
  // final cvHV = (cd + cr)*2;
  // print('CHU VI CN LÀ $cvHV');
  // print('DIEN TICH CN LA $dtHV');

  // //bai toan tinh CV dien tich hinh tam giac
  // var a = 5;
  // var b = 8;
  // var c = 100;
  // var chuVi = b + a + c;
  // var p = chuVi / 2;
  // var dienTich = sqrt(p*(p-a)+(p-b)+(p-c));
  // print('CHU VI LÀ $chuVi');
  // print('DIEN TICH LA $dienTich');

  // //Toan tu so hoc
  // var d = 5;
  // print(d++);
  // ++d;
  // print(d);

  // //So sanh A va B
  // print("Hay nhap so a: ");
  // var A = int.parse(stdin.readLineSync()?? '0');
  // print("Hay nhap so B: ");
  // var B = int.parse(stdin.readLineSync()?? '0');
  // print(A);
  // print(B);
  // if (A>B){
  //   print("A lon hon B");
  // }
  // else if(A==B){
  //   print("A va B bang nhau");
  // }
  // else{
  //   print("B lon hon A");
  // }

  //Kiem tra sv đậu hay rớt
  print("Nhap vao HoTenSV: ");
  String? HoTenSV = stdin.readLineSync();

  print("Hay nhap đ Toan: ");
  double dToan = double.parse(stdin.readLineSync()!);

  print("Hay nhap đ Ly: ");
  double dLy = double.parse(stdin.readLineSync()!);

  print("Hay nhap đ Hoa: ");
  double dHoa = double.parse(stdin.readLineSync()!);

  double dtb = (dToan + dLy + dHoa)/3;
  
  print("điểm trung bình 3 môn là: +${dtb.toStringAsFixed(2)}");

  if ( (dToan ?? 0) < 4 || (dLy ?? 0) < 4 || (dHoa ?? 0) < 4){
    print("Trượt môn");
    return;
  }
  
  print("điểm trung bình 3 môn là: +${dtb.toStringAsFixed(2)}");
  print("điểm trung bình 3 môn là: +${dtb.toStringAsFixed(2)}");
  if (dtb<5){
    print("Học Lực Yếu");
  }
  else if(dtb<6.5){
    print("Học Lực Trung Bình");
  }
  else if(dtb<8){
    print("Học Lực Khá");
  }
  else{
    print("Học Lực Giỏi");
  }
}