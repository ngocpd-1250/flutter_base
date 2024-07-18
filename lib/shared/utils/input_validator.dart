import 'package:base_flutter/shared/extensions/string_extension.dart';

final class InputValidator {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Please enter your email";
    }
    if (!email.isValidEmail) {
      return "Invalid email";
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Please enter your password";
    }
    if (!password.isValidPassword) {
      return "Invalid password";
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Please enter your confirm password";
    }
    if (password != confirmPassword) {
      return "Password does not match";
    }
    return null;
  }
}
