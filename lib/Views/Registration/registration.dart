import 'package:flutter/material.dart';
import 'package:mafia_game_front/Views/Registration/controller.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String _email = '';
  String _username = '';
  String _password = '';
  String _repeatPassword = '';

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

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(hintText: "email"),
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
                        ),
                        TextFormField(
                            decoration: const InputDecoration(
                                hintText: "repeat password"),
                            onChanged: setRepeatPassword,
                            validator: (repeatPassword) =>
                                RegistrationController.isPasswordMatch(
                                    _password, repeatPassword)),
                        TextButton(
                            onPressed: () => {
                                  if (_formKey.currentState!.validate())
                                    {
                                      RegistrationController.createUser(_email,
                                          _username, _password, _repeatPassword)
                                    }
                                },
                            child: const Text("Signup")),
                      ],
                    )))));
  }
}
