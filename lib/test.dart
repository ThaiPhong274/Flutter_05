String findRange(int num) {
 if (num >= 1 && num <= 10) {
 return "Nhỏ"; 
 } else if (num <= 15) {
 return "Trung bình";
 } else {
 return "Lớn"; 
 } 
}

void main() {
 int n = 15;
 print("Phạm vi: ${findRange(n)}");
}