// login_cubit.dart
import 'package:ecommerce_app/cubit/cubit/login_state.dart';
import 'package:ecommerce_app/services/Login_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginService _loginService;

  LoginCubit(this._loginService) : super(LoginInitial());

  Future<void> login(String identifier, String password) async {
    if (identifier.isEmpty || password.isEmpty) {
      emit(LoginError('Please fill in all fields'));
      return;
    }

    emit(LoginLoading());

    try {
      final result = await _loginService.login(identifier, password);

      if (result.success) {
        emit(LoginSuccess(result.user!));
      } else {
        emit(LoginError(result.errorMessage!));
      }
    } catch (e) {
      emit(LoginError('An unexpected error occurred: $e'));
    }
  }

  void reset() {
    emit(LoginInitial());
  }
}
