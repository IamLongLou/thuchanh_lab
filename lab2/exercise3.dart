void main() {
  // Kiểm tra điểm số bằng if/else
  int score = 49;

  if (score >= 50) {
    print("Score = $score => PASS");
  } else {
    print("Score = $score => FAIL");
  }

  // Sử dụng switch case cho ngày trong tuần
  int day = 8;
  String dayName;

  switch (day) {
    case 1:
      dayName = "Monday";
      break;
    case 2:
      dayName = "Tuesday";
      break;
    case 3:
      dayName = "Wednesday";
      break;
    case 4:
      dayName = "Thursday";
      break;
    case 5:
      dayName = "Friday";
      break;
    case 6:
      dayName = "Saturday";
      break;
    case 7:
      dayName = "Sunday";
      break;
    default:
      dayName = "Invalid day";
  }
  print("Day $day => $dayName");

  // Vòng lặp qua một tập hợp
  List<String> fruits = ["Apple", "Banana", "Mango"];

  print("\nLoop using for:");
  for (int i = 0; i < fruits.length; i++) {
    print("Fruit at index $i: ${fruits[i]}");
  }

  print("\nLoop using for-in:");
  for (var fruit in fruits) {
    print("Fruit: $fruit");
  }

  print("\nLoop using forEach:");
  fruits.forEach((fruit) {
    print("Fruit: $fruit");
  });

  // Sử dụng hàm bình thường và hàm rút gọn
  print("\nSum = ${sum(10, 20)}");
  print("Product = ${product(4, 5)}");
}

// Hàm bình thường
int sum(int a, int b) {
  return a + b;
}

// Hàm rút gọn (arrow syntax)
int product(int a, int b) => a * b;
