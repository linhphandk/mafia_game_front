import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grpc/grpc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mafia_game_front/Security/tokens.dart';
import 'package:mafia_game_front/Vendors/socials.dart';
import 'package:mafia_game_front/Views/Login/controller.dart';
import 'package:mafia_game_front/Views/Login/login.dart';
import 'package:mafia_game_front/Views/Registration/controller.dart';
import 'package:mafia_game_front/Views/Registration/registration.dart';
import 'package:mafia_game_front/Services/user_service.dart';
import 'package:mafia_game_front/Proto/account.pbgrpc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final channel = ClientChannel('10.0.2.2',
      port: 50051,
      options:
          const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );
  //TODO: Handle catchError
  final perfs = await SharedPreferences.getInstance();

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  final secureStorage = FlutterSecureStorage(aOptions: _getAndroidOptions());
  final socialsInstance = Socials(googleSignIn);
  final accountClientInstance = accountClient(channel,
      options: CallOptions(timeout: const Duration(seconds: 30)));
  final userService = UserService(accountClientInstance, socialsInstance);
  final imagePicker = ImagePicker();
  runApp(MyApp(userService, imagePicker, perfs,secureStorage));
}

class MyApp extends StatelessWidget {
  final UserService userService;
  final ImagePicker imagePicker;
  final SharedPreferences perfs;
  final FlutterSecureStorage secureStorage;
  const MyApp(this.userService, this.imagePicker, this.perfs, this.secureStorage, {Key? key}) : super(key: key);

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
      home: Login(LoginController(userService, perfs, secureStorage)),
//      home: (context) => Login(LoginController(userService)),
      routes: {
        '/register': (context) =>
            Registration(RegistrationController(userService, imagePicker)),
        '/home': (context) => Login(LoginController(userService, perfs, secureStorage)),
      },
    );
  }
}
