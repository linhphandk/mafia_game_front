import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:mafia_game_front/Proto/account.pbgrpc.dart';
import 'package:mafia_game_front/Views/Registration/controller.dart';

class Registration extends StatefulWidget {
  final RegistrationController controller;
  Registration(this.controller, {Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

@injectable
class _RegistrationState extends State<Registration> {
  String _email = '';
  String _username = '';
  String _password = '';
  String _repeatPassword = '';
  String? _profileImage;
  String? _registrationError;
  void setEmail(String email) {
    setState(() {
      _email = email;
    });
  }

  void setUsername(String username) {
    setState(() {
      _username = username;
    });
  }

  void setPassword(String password) {
    setState(() {
      _password = password;
    });
  }

  void setRepeatPassword(String repeatPassword) {
    setState(() {
      _repeatPassword = repeatPassword;
    });
  }

  void setProfileImage(String? profileImage) {
    if (profileImage == null) {
      return;
    }
    setState(() {
      _profileImage = "http://10.0.2.2:4566/images/" + profileImage;
    });
  }

  void setRegistrationError(String? errorText) {
    setState(() {
      _registrationError = errorText;
    });
  }

  void handleImageTap() {
    widget.controller.selectImageFromGallery().then((xFile) => {
          if (xFile != null)
            {
              widget.controller
                  .uploadImage(xFile)
                  .then((value) => setProfileImage(value))
            }
        });
  }

  void handleRegister() {
    if (_formKey.currentState!.validate()) {
      widget.controller.createUser(
          _email, _username, _password, _repeatPassword, _profileImage);
    }
  }

  void handleSignUpGoogle() async {
    final res =
        await widget.controller.handleGoogleSignin().catchError((error) {
      setRegistrationError("Something went wrong ...");
      return Future.value(null);
    });

    final serverAuthCode = res?.serverAuthCode;
    if (serverAuthCode == null) {
      setRegistrationError("Google account not found");
      return;
    }

    await widget.controller
        .registerGoogleUser(
      serverAuthCode,
    )
        .catchError((error) {
      if (error.runtimeType == GrpcError) {
        setRegistrationError("Something went wrong ...");
        return Future<LoginResponse>.value(LoginResponse());
      }
      setRegistrationError("Something went wrong ...");
      return Future<LoginResponse>.error(error);
    });
  }

  void navigateSignup() {
    Navigator.pushNamed(context, '/home');
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(children: [
                  Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: handleImageTap,
                            child: _profileImage == null
                                ? Image.asset('assets/user.png', width: 100)
                                : Image.network(
                                    _profileImage!,
                                    width: 100,
                                    height: 100,
                                  ),
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(hintText: "email"),
                            onChanged: setEmail,
                            validator: RegistrationController.validateEmail,
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(hintText: "username"),
                            onChanged: setUsername,
                            validator: RegistrationController.validateUsername,
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(hintText: "password"),
                            onChanged: setPassword,
                            validator: RegistrationController.validatePassword,
                            obscureText: true,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                hintText: "repeat password"),
                            onChanged: setRepeatPassword,
                            validator: (repeatPassword) =>
                                RegistrationController.isPasswordMatch(
                                    _password, repeatPassword),
                            obscureText: true,
                          ),
                          Text(_registrationError ?? ''),
                          TextButton(
                              onPressed: handleSignUpGoogle,
                              child: const Text("Google")),
                          TextButton(
                              onPressed: handleRegister,
                              child: const Text("Sign up")),
                        ],
                      )),
                  GestureDetector(
                    child: const Text("Switch to log in"),
                    onTap: navigateSignup,
                  )
                ]))));
  }
}
