import 'package:injectable/injectable.dart';
import 'package:mafia_game_front/Validators/user_validator.dart';

import '../Entities/user.dart';

@injectable
class UserService {
  User? createUser(
      String email, String username, String password, String repeatPassword) {
    if (validateEmail(email) != null) {
      return null;
    }

    if (validateUsername(username) != null) {
      return null;
    }

    if (validatePassword(password).isNotEmpty) {
      return null;
    }

    if (password != repeatPassword) {
      return null;
    }
    return User(email, username, password);
  }
}
