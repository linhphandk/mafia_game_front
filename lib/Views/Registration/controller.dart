import 'package:mafia_game_front/Entities/user.dart';
import 'package:mafia_game_front/Services/user_service.dart';

import '../../Validators/user_validator.dart' as validation;

class RegistrationController {
  final UserService userService;
  const RegistrationController(this.userService);
  static String? validateEmail(String? email) {
    if (email == null) {
      return null;
    }
    final res = validation.validateEmail(email);

    switch (res) {
      case validation.EMAIL_ERROR.invalid:
        return "Invalid Email";
      default:
        return null;
    }
  }

  static String? validateUsername(String? username) {
    if (username == null) {
      return null;
    }
    final res = validation.validateUsername(username);

    switch (res) {
      case validation.USERNAME_ERROR.empty:
        return "Enter username";
      case validation.USERNAME_ERROR.short:
        return "Username should be longer than 8 characters";
      default:
        return null;
    }
  }

  static String? validatePassword(String? password) {
    if (password == null) {
      return null;
    }
    final res = validation.validatePassword(password);
    if (res.isEmpty) {
      return null;
    }
    String passwordMessage = "Password should ";
    String errors = res.fold<String>(passwordMessage, (previousValue, element) {
      String? errorMessage = getErrorMessage(element);
      return errorMessage ?? '';
    });

    return errors;
  }

  static String? isPasswordMatch(String? password, String? repeatPassword) {
    return password == repeatPassword ? null : 'Passwords do not match';
  }

  static String? getErrorMessage(validation.PASSWORD_ERROR error) {
    switch (error) {
      case validation.PASSWORD_ERROR.specialCharacter:
        return "has to contain a special character";
      case validation.PASSWORD_ERROR.uppercase:
        return "has to container an uppercase letter";
      case validation.PASSWORD_ERROR.length:
        return "has to be at least 8 characters long";
      default:
        return null;
    }
  }

  void createUser(
      String email, String username, String password, String repeatPassword) {
    userService.createUser(email, username, password, repeatPassword);
  }
}
