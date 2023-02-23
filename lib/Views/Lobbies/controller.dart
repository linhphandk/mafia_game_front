import 'dart:ffi';

import 'package:grpc/service_api.dart';
import 'package:mafia_game_front/Proto/account.pb.dart';

import '../../Services/user_service.dart';

class LobbiesController {
  LobbiesController();

  List<int> getLobbies() {
    return [1, 2, 3, 4, 5];
  }
}
