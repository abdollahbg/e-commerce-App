// user_model.dart
class UserModel {
  final int id;
  final String email;
  final String username;
  final String password;
  final Name name;
  final String phone;

  UserModel({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
      name: Name.fromJson(json['name']),
      phone: json['phone'],
    );
  }

  // التحقق من تطابق بيانات الدخول
  bool validateLogin(String identifier, String password) {
    return (username == identifier ||
            email == identifier ||
            phone == identifier) &&
        this.password == password;
  }
}

class Name {
  final String firstname;
  final String lastname;

  Name({required this.firstname, required this.lastname});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(firstname: json['firstname'], lastname: json['lastname']);
  }

  String get fullName => '$firstname $lastname';
}
