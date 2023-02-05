import 'package:mafia_game_front/Proto/mafia.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Annotation which generates the cat.mocks.dart library and the MockCat class.
@GenerateNiceMocks([MockSpec<UserService>()])
import 'cat.mocks.dart';

class UserService {
  final accountClient accountClientInstance;
  UserService(this.accountClientInstance);

  ResponseFuture<RegisterResponse> createUser(
    String email, String username, String password, String repeatPassword) {
    final result = accountClientInstance.register(
        UserData(username: username, email: email, password: password));
    return result;
  }
}
