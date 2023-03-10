import 'package:grpc/service_api.dart';
import 'package:mafia_game_front/Proto/account.pb.dart';

import '../../Services/user_service.dart';

class LoginController {
  final UserService userService;

  LoginController(this.userService);

  ResponseFuture<LoginResponse> login(String email, String password) {
    return userService.login(email, password);
  }
}
