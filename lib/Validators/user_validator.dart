enum USERNAME_ERROR {
  empty,
  short,
}

USERNAME_ERROR? validateUsername(String username) {
  if (username.trim().isEmpty) {
    return USERNAME_ERROR.empty;
  }

  if (username.length < 8) {
    return USERNAME_ERROR.short;
  }

  return null;
}

enum EMAIL_ERROR {
  invalid,
}

//ignore: unnecessary_string_escapes
const emailRegex = r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$";

EMAIL_ERROR? validateEmail(String email) =>
    RegExp(emailRegex).hasMatch(email) ? null : EMAIL_ERROR.invalid;

const passwordUpperRegex = r"[A-Z]";
const passwordSpecialChar = r'[!@#$%^&*(),.?":{}|<>]';

enum PASSWORD_ERROR { uppercase, length, specialCharacter }

List<PASSWORD_ERROR> validatePassword(String password) {
  final List<PASSWORD_ERROR> errors = List.empty(growable: true);

  if (!RegExp(passwordUpperRegex).hasMatch(password)) {
    errors.add(PASSWORD_ERROR.uppercase);
  }

  if (!RegExp(passwordSpecialChar).hasMatch(password)) {
    errors.add(PASSWORD_ERROR.specialCharacter);
  }

  if (password.length < 8) {
    errors.add(PASSWORD_ERROR.length);
  }

  return errors;
}
