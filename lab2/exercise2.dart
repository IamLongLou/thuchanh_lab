void main() {
  // 1. Khai báo danh sách số nguyên
  List<int> numbers = [2, 4, 6, 8, 10];

  print("List of integers: $numbers");

  // TOÁN TỬ (OPERATORS)
  int a = 15;
  int b = 5;

  print("\na = $a, b = $b");

  // Toán tử số học (Arithmetic operators)
  print("a + b = ${a + b}");
  print("a - b = ${a - b}");

  // Toán tử so sánh (Comparison operator)
  print("a == b ? ${a == b}");

  // Toán tử logic && (Logical operator)
  bool check = (a > b) && (b > 0);
  print("(a > b) && (b > 0) = $check");

  // Toán tử ba ngôi (Ternary operator)
  String result = (a > b) ? "a is greater" : "a is smaller or equal";
  print("Ternary result: $result");

  // 2. TẬP HỢP (SET - các giá trị là duy nhất)
  Set<int> uniqueNumbers = {1, 2, 2, 3, 4, 4, 5};
  print("\nSet values (unique): $uniqueNumbers");

  uniqueNumbers.add(6);
  print("After adding 6: $uniqueNumbers");

  uniqueNumbers.remove(3);
  print("After removing 3: $uniqueNumbers");

  // 3. BẢN ĐỒ (MAP - cặp key-value)
  Map<String, dynamic> student = {
    "name": "Nguyen Bao Long",
    "age": 23,
    "gpa": 3.0
  };

  print("\nStudent Map: $student");
  print("Student name: ${student['name']}");
  print("Student GPA: ${student['gpa']}");

  // Cập nhật giá trị trong map
  student['age'] = 21;
  print("After updating age: $student");
}
