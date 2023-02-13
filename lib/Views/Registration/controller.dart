import 'package:grpc/service_api.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mafia_game_front/Proto/mafia.pb.dart';

import '../../Services/user_service.dart';
import '../../Validators/user_validator.dart' as validation;

class RegistrationController {
  final UserService userService;
  final ImagePicker imagePicker;

  RegistrationController(this.userService, this.imagePicker);
  static String? validateEmail(String? email) {
    if (email == null) {
      return null;
    }
    final res = validation.validateEmail(email);

    switch (res) {
      case validation.EmailError.invalid:
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
      case validation.UsernameError.empty:
        return "Enter username";
      case validation.UsernameError.short:
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

  static String? getErrorMessage(validation.PasswordError error) {
    switch (error) {
      case validation.PasswordError.specialCharacter:
        return "has to contain a special character";
      case validation.PasswordError.uppercase:
        return "has to container an uppercase letter";
      case validation.PasswordError.length:
        return "has to be at least 8 characters long";
      default:
        return null;
    }
  }

  Future<String> uploadImage(XFile profileImage) async {
    return userService
        .uploadProfilePicture(profileImage)
        .then((value) => value.url);
  }

  Future<XFile?> selectImageFromGallery() async {
    return await imagePicker.pickImage(source: ImageSource.gallery);
  }

  ResponseFuture<RegisterResponse> createUser(String email, String username,
      String password, String repeatPassword, String? profileImageName) {
    return userService.createUser(
        email, username, password, repeatPassword, profileImageName);
  }
}
