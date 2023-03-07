import 'package:google_sign_in/google_sign_in.dart';

class Socials {
  final GoogleSignIn _googleSignIn;
  Socials(this._googleSignIn);
  Future<GoogleSignInAccount?> signUpGoogle() {
    return _googleSignIn.signIn();
  }
}
