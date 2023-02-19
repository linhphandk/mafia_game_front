enum UsernameError{
  empty,
  short,
}

UsernameError? validateUsername(String username) {
  if (username.trim().isEmpty) {
    return UsernameError.empty;
  }

  if (username.length < 8) {
    return UsernameError.short;
  }

  return null;
}

enum EmailError {
  invalid,
}

//ignore: unnecessary_string_escapes
const emailRegex = r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$";

EmailError? validateEmail(String email) =>
    RegExp(emailRegex).hasMatch(email) ? null : EmailError.invalid;

const passwordUpperRegex = r"[A-Z]";
const passwordSpecialChar = r'[!@#$%^&*(),.?":{}|<>]';

enum PasswordError { uppercase, length, specialCharacter }

List<PasswordError> validatePassword(String password) {
  final List<PasswordError> errors = List.empty(growable: true);

  if (!RegExp(passwordUpperRegex).hasMatch(password)) {
    errors.add(PasswordError.uppercase);
  }

  if (!RegExp(passwordSpecialChar).hasMatch(password)) {
    errors.add(PasswordError.specialCharacter);
  }

  if (password.length < 8) {
    errors.add(PasswordError.length);
  }

  return errors;
}
