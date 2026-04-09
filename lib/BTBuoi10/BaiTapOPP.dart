import 'dart:io';

// ===== MAIN =====
void main() {
  while (true) {
    print("\n===== MENU =====");
    print("1. Them hoc sinh");
    print("2. Them giao vien");
    print("3. Tao lop");
    print("4. Nhap diem");
    print("5. Gan giao vien");
    print("6. Gan hoc sinh vao lop");
    print("7. DS hoc sinh");
    print("8. DS giao vien");
    print("9. Bao cao lop");
    print("0. Thoat");

    int ch = inputInt("Chon: ", 0, 9);

    switch (ch) {
      case 1:
        addStudent();
        break;
      case 2:
        addTeacher();
        break;
      case 3:
        createClass();
        break;
      case 4:
        inputScore();
        break;
      case 5:
        assignTeacher();
        break;
      case 6:
        assignStudent();
        break;
      case 7:
        showStudents();
        break;
      case 8:
        showTeachers();
        break;
      case 9:
        showReport();
        break;
      case 0:
        print("Thoat chuong trinh");
        return;
    }
  }
}

// ===== PERSON =====
class Person {
  String id;
  String name;
  int age;
  String gender;
  String? className;

  Person(this.id, this.name, this.age, this.gender);
}

// ===== STUDENT =====
class Student extends Person {
  double math = 0;
  double literature = 0;
  double english = 0;

  Student(String id, String name, int age, String gender)
      : super(id, name, age, gender);

  double avg() => (math + literature + english) / 3;

  String rank() {
    double a = avg();
    if (a >= 8) return "Gioi";
    if (a >= 6.5) return "Kha";
    if (a >= 5) return "Trung binh";
    return "Yeu";
  }

  void display() {
    print(
        "HS | $name | Tuoi: $age | Lop: ${className ?? "Chua co"} "
        "| Toan: ${math.toStringAsFixed(1)}"
        " | Van: ${literature.toStringAsFixed(1)}"
        " | Anh: ${english.toStringAsFixed(1)}"
        " | TB: ${avg().toStringAsFixed(2)}"
        " | Xep loai: ${rank()}");
  }
}

// ===== TEACHER =====
class Teacher extends Person {
  String subject;
  double salary;

  Teacher(String id, String name, int age, String gender, this.subject,
      this.salary)
      : super(id, name, age, gender);

  void display() {
    print(
        "GV | $name | Tuoi: $age | Mon: $subject | Lop: ${className ?? "Chua co"}");
  }
}

// ===== CLASSROOM =====
class Classroom {
  String id;
  String name;
  List<Student> students = [];
  Teacher? teacher;

  Classroom(this.id, this.name);

  void addStudent(Student s) {
    if (s.className != null) {
      print("Hoc sinh da co lop");
      return;
    }
    students.add(s);
    s.className = name;
    print("Da them hoc sinh vao lop");
  }

  void assignTeacher(Teacher t) {
    if (teacher != null) {
      print("Lop da co giao vien");
      return;
    }
    if (t.className != null) {
      print("Giao vien da co lop");
      return;
    }
    teacher = t;
    t.className = name;
    print("Da gan giao vien");
  }

  void display() {
    print("\n===== LOP: $name =====");

    if (teacher != null) {
      teacher!.display();
    } else {
      print("Chua co giao vien");
    }

    if (students.isEmpty) {
      print("Danh sach hoc sinh trong");
      return;
    }

    var list = List<Student>.from(students);
    list.sort((a, b) => b.avg().compareTo(a.avg()));

    for (var s in list) {
      s.display();
    }
  }
}

// ===== DATA =====
List<Student> studentList = [];
List<Teacher> teacherList = [];
List<Classroom> classList = [];

// ===== INPUT =====
int inputInt(String msg, int min, int max) {
  int value;
  do {
    stdout.write(msg);
    value = int.tryParse(stdin.readLineSync()!) ?? -1;
    if (value < min || value > max) {
      print("Nhap tu $min den $max");
    }
  } while (value < min || value > max);
  return value;
}

double inputDouble(String msg, double min, double max) {
  double value;
  do {
    stdout.write(msg);
    value = double.tryParse(stdin.readLineSync()!) ?? -1;
    if (value < min || value > max) {
      print("Nhap tu $min den $max");
    }
  } while (value < min || value > max);
  return value;
}

String inputString(String msg) {
  stdout.write(msg);
  return stdin.readLineSync()!.trim();
}

String inputGender(String msg) {
  String g;
  do {
    stdout.write(msg);
    g = stdin.readLineSync()!.trim().toLowerCase();
    if (g != "nam" && g != "nu") {
      print("Chi nhap nam hoac nu");
    }
  } while (g != "nam" && g != "nu");

  return g == "nam" ? "Nam" : "Nu";
}

// ===== THEM =====
void addStudent() {
  studentList.add(Student(
    inputString("ID: "),
    inputString("Ten: "),
    inputInt("Tuoi: ", 0, 65),
    inputGender("Gioi tinh: "),
  ));
  print("Da them hoc sinh");
}

void addTeacher() {
  teacherList.add(Teacher(
    inputString("ID: "),
    inputString("Ten: "),
    inputInt("Tuoi: ", 0, 65),
    inputGender("Gioi tinh: "),
    inputString("Mon: "),
    inputDouble("Luong: ", 0, 100000000),
  ));
  print("Da them giao vien");
}

void createClass() {
  classList.add(Classroom(
    inputString("ID lop: "),
    inputString("Ten lop: "),
  ));
  print("Da tao lop");
}

// ===== NHAP DIEM =====
void inputScore() {
  if (studentList.isEmpty) {
    print("Khong co hoc sinh");
    return;
  }

  for (int i = 0; i < studentList.length; i++) {
    print("${i + 1}. ${studentList[i].name}");
  }

  int i = inputInt("Chon hoc sinh: ", 1, studentList.length) - 1;

  print("Dang nhap diem cho: ${studentList[i].name}");

  studentList[i].math = inputDouble("Toan: ", 0, 10);
  studentList[i].literature = inputDouble("Van: ", 0, 10);
  studentList[i].english = inputDouble("Anh: ", 0, 10);

  print("Da cap nhat diem");
}

// ===== GAN =====
void assignTeacher() {
  if (classList.isEmpty) {
    print("Chua co lop");
    return;
  }
  if (teacherList.isEmpty) {
    print("Chua co giao vien");
    return;
  }

  for (int i = 0; i < classList.length; i++) {
    print("${i + 1}. ${classList[i].name}");
  }
  int c = inputInt("Chon lop: ", 1, classList.length) - 1;

  for (int i = 0; i < teacherList.length; i++) {
    print("${i + 1}. ${teacherList[i].name}");
  }
  int t = inputInt("Chon GV: ", 1, teacherList.length) - 1;

  classList[c].assignTeacher(teacherList[t]);
}

void assignStudent() {
  if (classList.isEmpty) {
    print("Chua co lop");
    return;
  }
  if (studentList.isEmpty) {
    print("Chua co hoc sinh");
    return;
  }

  for (int i = 0; i < classList.length; i++) {
    print("${i + 1}. ${classList[i].name}");
  }
  int c = inputInt("Chon lop: ", 1, classList.length) - 1;

  for (int i = 0; i < studentList.length; i++) {
    print("${i + 1}. ${studentList[i].name}");
  }
  int s = inputInt("Chon HS: ", 1, studentList.length) - 1;

  classList[c].addStudent(studentList[s]);
}

// ===== HIEN =====
void showStudents() {
  if (studentList.isEmpty) {
    print("Danh sach hoc sinh trong");
    return;
  }

  for (var s in studentList) {
    s.display();
  }
}

void showTeachers() {
  if (teacherList.isEmpty) {
    print("Danh sach giao vien trong");
    return;
  }

  for (var t in teacherList) {
    t.display();
  }
}

void showReport() {
  if (classList.isEmpty) {
    print("Chua co lop");
    return;
  }

  for (var c in classList) {
    c.display();
  }
}

