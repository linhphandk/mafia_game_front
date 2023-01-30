
import 'package:mafia_game_front/Proto/mafia.pbgrpc.dart';
import 'package:mafia_game_front/Validators/user_validator.dart';
import 'package:mafia_game_front/Proto/mafia.pb.dart';
import '../Entities/user.dart';
import 'package:protobuf/protobuf.dart';
import 'package:grpc/grpc.dart';
class UserService {
    const UserService();
    ResponseFuture<RegisterResponse> createUser(
      String email, String username, String password, String repeatPassword) {
    final channel = ClientChannel('10.0.2.2',
    port: 50051,
    options: const ChannelOptions(
        credentials: ChannelCredentials.insecure()));
    final client =accountClient(channel,
    options: CallOptions(timeout: const Duration(seconds: 30)));
    final result = client.register(UserData(username: username, email: email, password: password));
    return result;
  }
}
