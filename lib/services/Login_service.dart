// login_service.dart
import 'package:dio/dio.dart';
import 'package:ecommerce_app/models/user_model.dart';

class LoginService {
  final Dio _dio = Dio();
  static const String baseUrl = 'https://fakestoreapi.com';
  List<UserModel> _usersCache = [];

  LoginService() {
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(seconds: 15),
      receiveTimeout: Duration(seconds: 15),
    );
  }

  Future<void> _loadUsers() async {
    try {
      final Response response = await _dio.get('/users');
      if (response.statusCode == 200) {
        _usersCache = (response.data as List)
            .map((userJson) => UserModel.fromJson(userJson))
            .toList();
      }
    } on DioException catch (e) {
      throw Exception('Failed to load data: ${e.message}');
    }
  }

  Future<LoginResult> login(String identifier, String password) async {
    try {
      if (_usersCache.isEmpty) {
        await _loadUsers();
      }

      final user = _usersCache.firstWhere(
        (user) => user.validateLogin(identifier, password),
        orElse: () => UserModel(
          id: -1,
          email: '',
          username: '',
          password: '',
          name: Name(firstname: '', lastname: ''),
          phone: '',
        ),
      );

      if (user.id != -1) {
        return LoginResult.success(user);
      } else {
        return LoginResult.failure('Invalid login credentials');
      }
    } catch (e) {
      return LoginResult.failure('Connection error: $e');
    }
  }
}

class LoginResult {
  final bool success;
  final UserModel? user;
  final String? errorMessage;

  LoginResult.success(this.user) : success = true, errorMessage = null;

  LoginResult.failure(this.errorMessage) : success = false, user = null;
}
