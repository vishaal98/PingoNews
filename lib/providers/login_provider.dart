import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:pingo_news/repositories/login_repository.dart';

enum LoginValidationType { email, password, validateAll }

enum AuthenticationType { login, signUp }

class LoginProvider extends ChangeNotifier {
  String? _name;

  String? get name => _name;

  set name(String? value) {
    _name = value;
  }

  String? _email;
  String? _password;
  bool? isLoggedIn = false;
  bool? isSignedUp = false;
  String? validation;

  final LoginRepository _loginRepo = LoginRepository();

  set email(String value) {
    _email = value;
    validate(LoginValidationType.email);
  }

  set password(String value) {
    _password = value;
    validate(LoginValidationType.password);
  }

  Future<void> login(AuthenticationType authenticationType) async {
    validate(LoginValidationType.validateAll);
    if (validation == null) {
      if (authenticationType == AuthenticationType.login) {
        isLoggedIn =
            await _loginRepo.localSignIn(_email!, _password!) == 'success';
        notifyListeners();
      } else {
        isSignedUp = await _loginRepo.createUserProfile(_email!, _password!) ==
            'success';
        if (isSignedUp ?? false) {
          await login(AuthenticationType.login);
          notifyListeners();
        }
      }
    }
    notifyListeners();
  }

  String? get _validateEmail {
    if (_email == null || _email!.isEmpty) {
      // Null check handled
      return "Email is Empty";
    } else if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(_email!)) {
      // Null check handled
      return "Invalid email format";
    }
    return null;
  }

  String? get _validatePassword {
    if (_password == null || _password!.isEmpty) {
      // Null check handled
      return "Empty Password";
    }
    return null;
  }

  void validate(LoginValidationType validationType) {
    String? emailValidation = _validateEmail;
    String? passwordValidation = _validatePassword;
    switch (validationType) {
      case LoginValidationType.email:
        validation = emailValidation;
        break;
      case LoginValidationType.password:
        validation = passwordValidation;
        break;
      case LoginValidationType.validateAll:

        /// When both fields are invalid
        if ((emailValidation ?? '').isNotEmpty &&
            (passwordValidation ?? '').isNotEmpty) {
          validation = "Invalid Email and Password";
        } else if ((emailValidation ?? '').isNotEmpty) {
          validation = emailValidation;
        } else if ((passwordValidation ?? '').isNotEmpty) {
          validation = passwordValidation;
        }
        break;
    }
  }
}
