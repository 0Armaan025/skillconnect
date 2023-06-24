import 'package:flutter/material.dart';
import 'package:skillconnect/features/auth/models/user.dart';

import '../repositories/auth_repository.dart';

class AuthController {
  final AuthRepository _authRepository = AuthRepository();

  void login(BuildContext context, String email, String password) async {
    return _authRepository.logIn(context, email, password);
  }

  void register(BuildContext context, UserModel model) async {
    return _authRepository.signUp(context, model);
  }
}
