import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
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

  void handleLogin() {
    widget.controller.login(_email, _password).catchError((error) {
      switch (error.message) {
        case "record not found":
          setLoginError("Wrong username or password");
          break;
        default:
          setLoginError("Something went wrong");
          break;
      }
      return 42;
    });
  }

  void registerHandler() {
    Navigator.pushNamed(context, '/register');
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
                            ],
                          )),
                      GestureDetector(
                        child: const Text("Create account"),
                        onTap: registerHandler,
                      )
                    ]))));
  }
}
