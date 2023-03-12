import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:mafia_game_front/Proto/account.pbgrpc.dart';
import 'package:mafia_game_front/Views/Login/controller.dart';

class Login extends StatefulWidget {
  final LoginController controller;
  Login(this.controller, {Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

@injectable
class _LoginState extends State<Login> {
  String _email = '';
  String _password = '';
  String? _loginError;

  void setEmail(String email) {
    setState(() {
      _email = email;
    });
  }

  void setPassword(String password) {
    setState(() {
      _password = password;
    });
  }

  void setLoginError(String? errorMessage) {
    setState(() {
      _loginError = errorMessage;
    });
  }

  void handleLogin() async {
   await widget.controller.login(_email, _password).catchError((error) {
      switch (error.message) {
        case "record not found":
          setLoginError("Wrong username or password");
          break;
        default:
          setLoginError("Something went wrong");
          break;
      }
      return Future<LoginResponse>.value(error);
    }).then((res) {
      widget.controller.persistLoginResponse(res.id,res.username,res.profileImage,res.accessToken,res.refreshToken);
    });
  }

  void registerHandler() {
    Navigator.pushNamed(context, '/register');
  }

  void handleLoginGoogle() async {
    final res =
        await widget.controller.handleGoogleSignin().catchError((error) {
      print(error);
      setLoginError("Something went wrong ...");
      return Future.value(null);
    });

    final authentication = await res?.authentication;
    final idToken = authentication?.idToken;
    if (idToken == null) {
      setLoginError("Google account not found");
      return;
    }

    final user = await widget.controller
        .loginGoogleUser(
      idToken,
    )
        .catchError((error) {
      print(error);
      if (error.runtimeType == GrpcError) {
        setLoginError("Something went wrong ...");
        return Future<LoginResponse>.value(LoginResponse());
      }
      setLoginError("Something went wrong ...");
      return Future<LoginResponse>.error(error);
    });
    print(user);
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                decoration:
                                    const InputDecoration(hintText: "email"),
                                onChanged: setEmail,
                              ),
                              TextFormField(
                                decoration:
                                    const InputDecoration(hintText: "password"),
                                onChanged: setPassword,
                                obscureText: true,
                              ),
                              if (_loginError != null) Text(_loginError!),
                              TextButton(
                                  onPressed: handleLogin,
                                  child: const Text("Log in")),
                              Text(_loginError ?? ''),
                              TextButton(
                                  onPressed: handleLoginGoogle,
                                  child: const Text("Google")),
                            ],
                          )),
                      GestureDetector(
                        child: const Text("Create account"),
                        onTap: registerHandler,
                      )
                    ]))));
  }
}
