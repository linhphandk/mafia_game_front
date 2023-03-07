import 'package:google_sign_in/google_sign_in.dart';
import 'package:grpc/service_api.dart';
import 'package:mafia_game_front/Proto/account.pb.dart';

import '../../Services/user_service.dart';

class LoginController {
  final UserService userService;

  LoginController(this.userService);

  ResponseFuture<LoginResponse> login(String email, String password) {
    return userService.login(email, password);
  }

  Future<GoogleSignInAccount?> handleGoogleSignin() {
    return userService.signUpGoogle();
  }

  ResponseFuture<LoginResponse> loginGoogleUser(GoogleSignInAccount account) {
    return userService.validateGoogleUser(account);
  }
}
