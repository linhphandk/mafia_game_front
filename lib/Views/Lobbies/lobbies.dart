import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mafia_game_front/Views/Lobbies/controller.dart';

class Lobbies extends StatefulWidget {
  final LobbiesController controller;
  Lobbies(this.controller, {Key? key}) : super(key: key);

  @override
  State<Lobbies> createState() => _LobbiesState();
}

@injectable
class _LobbiesState extends State<Lobbies> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('List'),
    ));
  }
}
