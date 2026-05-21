/**
 * Exercise 4 - Intro to OOP
 * Mục tiêu: Thực hành về class, object, constructor, kế thừa và ghi đè phương thức.
 */

void main() {
  // Tạo đối tượng Car bằng constructor thông thường
  Car car1 = Car("Toyota");
  car1.drive();

  // Tạo đối tượng Car bằng named constructor
  Car car2 = Car.sportsCar("Ferrari");
  car2.drive();

  // Tạo đối tượng ElectricCar (lớp con)
  ElectricCar eCar = ElectricCar("Tesla", 500);
  eCar.drive();
}

// CLASS: Car (Lớp cơ sở)
class Car {
  String brand;

  // Constructor thông thường
  Car(this.brand);

  // Named constructor
  Car.sportsCar(this.brand) {
    print("Sports Car created: $brand");
  }

  // Phương thức
  void drive() {
    print("$brand is driving with gasoline engine.");
  }
}

// CLASS: ElectricCar (Lớp con)
class ElectricCar extends Car {
  int batteryCapacity;

  // Constructor của lớp con
  ElectricCar(String brand, this.batteryCapacity) : super(brand);

  // Ghi đè phương thức (Method overriding)
  @override
  void drive() {
    print("$brand is driving silently with electric motor.");
    print("Battery capacity: $batteryCapacity kWh");
  }
}
