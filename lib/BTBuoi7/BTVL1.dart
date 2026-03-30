import 'dart:io';

void main() {
  List<Student> studentList = [];

  while (true) {
    print('\n===== MENU =====');
    print('1. Thêm sinh viên');
    print('2. Hiển thị danh sách');
    print('3. Tìm sinh viên có ĐTB cao nhất');
    print('0. Thoát');

    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        addStudent(studentList);
        break;
      case 2:
        showStudents(studentList);
        break;
      case 3:
        findTopStudent(studentList);
        break;
      case 0:
        print('Thoát chương trình!');
        return;
      default:
        print('Lựa chọn không hợp lệ!');
    }
  }
}

// ===== CLASS =====
class Student {
  String name;
  double mathScore;
  double physicsScore;
  double chemistryScore;

  Student(this.name, this.mathScore, this.physicsScore, this.chemistryScore);

  double getAverage() {
    return (mathScore + physicsScore + chemistryScore) / 3;
  }

  String getRank() {
    double avg = getAverage();

    if (avg < 5) {
      return 'Kém';
    } else if (avg < 7) {
      return 'Khá';
    } else if (avg < 9) {
      return 'Giỏi';
    } else {
      return 'Xuất sắc';
    }
  }

  void display() {
    print('\nTên: $name');
    print('Toán: $mathScore | Lý: $physicsScore | Hóa: $chemistryScore');
    print('ĐTB: ${getAverage().toStringAsFixed(2)}');
    print('Xếp loại: ${getRank()}');
  }
}

// ===== CHỨC NĂNG =====
// Thêm sinh viên
void addStudent(List<Student> list) {
  print('Nhập tên:');
  String name = stdin.readLineSync()!;

  print('Nhập điểm Toán:');
  double math = double.parse(stdin.readLineSync()!);

  print('Nhập điểm Lý:');
  double physics = double.parse(stdin.readLineSync()!);

  print('Nhập điểm Hóa:');
  double chemistry = double.parse(stdin.readLineSync()!);

  list.add(Student(name, math, physics, chemistry));
  print('Đã thêm sinh viên!');
}

// Hiển thị danh sách
void showStudents(List<Student> list) {
  if (list.isEmpty) {
    print('Danh sách rỗng!');
    return;
  }

  for (var student in list) {
    student.display();
  }
}

// Tìm sinh viên ĐTB cao nhất
void findTopStudent(List<Student> list) {
  if (list.isEmpty) {
    print('Danh sách rỗng!');
    return;
  }

  Student top = list[0];
  for (var student in list) {
    if (student.getAverage() > top.getAverage()) {
      top = student;
    }
  }
  
  print('\n===== SINH VIÊN GIỎI NHẤT =====');
  top.display();
}