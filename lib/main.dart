import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mafia_game_front/Views/Registration/controller.dart';
import 'package:mafia_game_front/Views/Registration/registration.dart';
import 'package:mafia_game_front/Services/user_service.dart';
import 'package:mafia_game_front/Proto/mafia.pbgrpc.dart';

void main() {
  final channel = ClientChannel('10.0.2.2',
      port: 50051,
      options:
          const ChannelOptions(credentials: ChannelCredentials.insecure()));

  final accountClientInstance = accountClient(channel,
        options: CallOptions(timeout: const Duration(seconds: 30)));
  final userService = UserService(accountClientInstance);
  final imagePicker = ImagePicker();
  runApp(MyApp(userService, imagePicker));
}

class MyApp extends StatelessWidget {
  final UserService userService;
  final ImagePicker imagePicker;
  const MyApp(this.userService, this.imagePicker, {Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Registration(RegistrationController(userService, imagePicker)),
    );
  }
}
