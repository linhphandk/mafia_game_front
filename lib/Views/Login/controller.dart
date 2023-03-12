import 'dart:ffi';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:grpc/service_api.dart';
import 'package:mafia_game_front/Proto/account.pb.dart';
import 'package:mafia_game_front/Repository/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Services/user_service.dart';
import '../../Security/tokens.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginController {
  final UserService userService;
  final SharedPreferences perfs;
  final FlutterSecureStorage secureStorage;
  LoginController(this.userService, this.perfs,this.secureStorage);

  ResponseFuture<LoginResponse> login(String email, String password) {
    return userService.login(email, password);
  }

  Future<GoogleSignInAccount?> handleGoogleSignin() {
    return userService.signUpGoogle();
  }

  ResponseFuture<LoginResponse> loginGoogleUser(String idToken) {
    return userService.loginGoogleUser(idToken);
  }

  void persistLoginResponse(String id, String username, String profileImage,
      String accessToken, String refreshToken ) {
    saveUserData(id, username, profileImage, perfs);
    saveTokens(accessToken, refreshToken, secureStorage);
  }
}
