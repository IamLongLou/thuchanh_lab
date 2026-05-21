void main() {
  print("Exercise 5: Factory Constructors & Cache");

  Settings a = Settings();
  Settings b = Settings();

  print("identical(a, b) -> \${identical(a, b)}"); // true
}

class Settings {
  static Settings? _instance;

  // private constructor
  Settings._internal();

  // factory constructor (singleton cache)
  factory Settings() {
    _instance ??= Settings._internal();
    return _instance!;
  }
}
