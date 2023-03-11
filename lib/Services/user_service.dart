import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mafia_game_front/Proto/account.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:mafia_game_front/Vendors/socials.dart';
import 'package:mockito/annotations.dart';

// Annotation which generates the cat.mocks.dart library and the MockCat class.
@GenerateNiceMocks([MockSpec<UserService>()])
class UserService {
  final accountClient _accountClientInstance;
  final Socials _socials;
  UserService(this._accountClientInstance, this._socials);

  ResponseFuture<RegisterResponse> createUser(String email, String username,
      String password, String repeatPassword, String? profileImageName) {
    final result = _accountClientInstance.register(UserData(
        username: username,
        email: email,
        password: password,
        profileImageName: profileImageName));
    return result;
  }

  ResponseFuture<LoginResponse> login(String email, String password) {
    final result = _accountClientInstance.login(UserLoginData(
      email: email,
      password: password,
    ));
    return result;
  }

  Future<ProfilePictureUrl> uploadProfilePicture(XFile image) async {
    File file = File(content: await image.readAsBytes());
    ProfilePicture picture = ProfilePicture(profileImage: file);
    final result = _accountClientInstance.uploadProfilePicture(picture);
    return result;
  }

  ResponseFuture<LoginResponse> createGoogleUser(String serverAuthCode) {
    final request = SocialUserData(authToken: serverAuthCode);
    return _accountClientInstance.createSocialLogin(request);
  }

  Future<GoogleSignInAccount?> signUpGoogle() {
    return _socials.signUpGoogle();
  }

  ResponseFuture<LoginResponse> loginGoogleUser(String idToken) {
    final request =
        SocialLoginData(socialType: SocialType.googleAuth, idToken: idToken);
    return _accountClientInstance.socialLogin(request);
  }
}
