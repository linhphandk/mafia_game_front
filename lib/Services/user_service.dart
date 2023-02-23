import 'package:image_picker/image_picker.dart';
import 'package:mafia_game_front/Proto/account.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:mockito/annotations.dart';

// Annotation which generates the cat.mocks.dart library and the MockCat class.
@GenerateNiceMocks([MockSpec<UserService>()])
class UserService {
  final accountClient accountClientInstance;
  UserService(this.accountClientInstance);

  ResponseFuture<RegisterResponse> createUser(String email, String username,
      String password, String repeatPassword, String? profileImageName) {
    final result = accountClientInstance.register(UserData(
        username: username,
        email: email,
        password: password,
        profileImageName: profileImageName));
    return result;
  }

  ResponseFuture<LoginResponse> login(String email, String password) {
    final result = accountClientInstance.login(UserLoginData(
      email: email,
      password: password,
    ));
    return result;
  }

  Future<ProfilePictureUrl> uploadProfilePicture(XFile image) async {
    File file = File(content: await image.readAsBytes());
    ProfilePicture picture = ProfilePicture(profileImage: file);
    final result = accountClientInstance.uploadProfilePicture(picture);
    return result;
  }
}
