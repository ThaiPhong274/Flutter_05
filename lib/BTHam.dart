import 'package:flutter_application_1/Student.dart';

void main() {
  final Minh = Student('Minh','M01','000');
  Minh.name;
  print(Minh.name);
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