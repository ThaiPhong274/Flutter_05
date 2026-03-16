import 'dart:io';
import 'dart:math';

void main() {
  //List 1
    // List<dynamic> nums = [1,2,3,4,5,'6',5];
    // print(nums);

    // Set<dynamic> nums1 = {1,2,3,4,5,'6',5};
    // print(nums1);

    // Map<String, dynamic> userA = {
    //   'name': 'Nguyen',
    //   'age': 18
    // };
    // print(userA);
    // print(userA['name']);

//.................................................................
  //List 2 thêm xoá list
    // List<int> nums = [];
    // nums.add(2);
    // nums.add(6);

    // print(nums);
    // print(nums[0]);

    // nums.remove(2);
    // print(nums);
    // nums.remove(6);
    // print(nums);

//.................................................................
    //List 3 thêm muns1 vào nums
    // List<int> nums = [];
    // List<int> nums1 = [1,2,3,4,5,6];
    // nums.add(2);
    // nums.add(6);
    // print(nums);
    // nums.addAll(nums1);
    // print(nums);

//.................................................................
    //List 4 Đối tượng con người cụ thể
    // List<dynamic> doituong = [
    //   {'name': 'Nguyen','age': 18},
    //   {'name': 'Van','age': 15}
    // ];
    // print(doituong);
    
    // //cập nhật data
    // doituong.firstWhere((object) => object['name'] == 'Van')['age']=18;
    // print(doituong);

    // doituong.add({'name': 'Manh An','age': 23});
    // print(doituong);

    // doituong.removeWhere((Object) => Object['name'] == 'Nguyen');
    // print(doituong);

//.................................................................
    // chuyển list sang set
    // var lstNumber = [1,2,3,4,3,2,1,5,6,7,7,8,8];
    // Set<int> setNumber = {};
    // for(int item in lstNumber){
    //   
    //   a.add(item);
    // };
    // setNumber.addAll(lstNumber);
    // IstNumber.toSet();
    // print(IstNumber);
    
    // var listNumber = [1,2,3,4,3,2,1,5,6,7,7,8,8];
    // Set<int> setNumber = listNumber.toSet();
    // print(setNumber);

//.................................................................
// Vòng lập 1 có 2 cách
    // List<int> nums = [1,2,3,4,5];
    //  for(int i = 0; i < nums.length; i++){
    //   print(nums[i]);
    //  }

    //  for (int i in nums){
    //   if(i % 2 ==0){
    //     print(i);
    //   }
    //  }

// Vòng lập 2
  // var index = 0;
  // do{
  //   index++;
  //   print(index);
  // } while (index<5);
  // while (index < 5){
  // index++;
  // print(index);
  // }

// BÀI TẬP VÒNG LẬP
//BT1
  // List<int> Linesnd = [];
  // var tsnd = 0;
  // print('Tổng số nguyên dương n:');
  // int nhapsnd = int.parse(stdin.readLineSync()!);

  // for (int i = 1; i <= nhapsnd; i++ ){
  //   print('Nhập vào số nguyên dương thứ $i:');
  //   int snd = int.parse(stdin.readLineSync()!);
  //   Linesnd.add(snd);
  //   tsnd += snd;
  // }
  // print('Danh sách số đã nhập: $Linesnd');
  // print('Tổng các số: $tsnd');

//BT2
//   print('Nhập số cửu chương:');
//   int n = int.parse(stdin.readLineSync()!);
//     for(int i = 0; i < 10; i++){
//       print('$n x $i = ${n*i}');
// }

//BT3
// var sole = 0;
// var sochan = 0;
// var i = 0;

//   List<int> Linesnd = [];
//   print('Tổng số nguyên dương n:');
//   int nhapsnd = int.parse(stdin.readLineSync()!);

//   for (int i = 1; i <= nhapsnd; i++ ){
//     print('Nhập vào số nguyên dương thứ $i:');
//     int snd = int.parse(stdin.readLineSync()!);
//     Linesnd.add(snd);
//   }
  
//   var j = 0;
//   while(j < nhapsnd){
//     j++;
//     if(j % 2 ==0){
//       sochan++;
//     }
//     else{
//       sole++;
//     }
//   }
//   print('Tổng số chẳn là: $sochan');
//   print('Tổng số lẻ là: $sole');

//BT4
// var reusult = 1;
// print('Nhập vào số nguyên dương n:');
// int snd = int.parse(stdin.readLineSync()!);
// for(int i = 1; i <= snd;i++){
//   reusult *= i;
// }
// print(reusult);

//BT5
var n = 1234;
var s = n.toString();
int i = s.length - 1;
var listResutl = [];

  while(i>=0){
    listResutl.add(s[i]);
    i--; 
  }

  print(listResutl);
}