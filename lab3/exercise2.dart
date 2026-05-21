import 'dart:convert';

Future<void> main() async {
  print("Exercise 2: User Repository with JSON");

  final repo = UserRepository();

  List<User> users = await repo.fetchUsers();
  print("Fetched users:");
  for (var u in users) {
    print(" $u");
  }
}

// User model
class User {
  final String name;
  final String email;

  User(this.name, this.email);

  // fromJson constructor
  factory User.fromJson(Map<String, dynamic> json) {
    return User(json["name"], json["email"]);
  }

  @override
  String toString() => "User(name: $name, email: $email)";
}

// Repository
class UserRepository {
  Future<List<User>> fetchUsers() async {
    await Future.delayed(Duration(milliseconds: 400));

    // Fake JSON list
    List<Map<String, dynamic>> jsonList = [
      {"name": "Nguyen Van A", "email": "Anv@gmail.com"},
      {"name": "Nguyen Van B", "email": "Bnv@gmail.com"},
      {"name": "Bui Van D", "email": "Dbv@gmail.com"},
    ];

    return jsonList.map((user) => User.fromJson(user)).toList();
  }
}
