import 'package:mafia_game_front/Validators/user_validator.dart';
import "package:test/test.dart";

void main() {
  group("Username", () {
    test("Empty username", () {
      const username = "";
      final res = validateUsername(username);
      expect(res, USERNAME_ERROR.empty);
    });

    test("Short username", () {
      const username = "1234567";
      final res = validateUsername(username);
      expect(res, USERNAME_ERROR.short);
    });

    test("Valid Username", () {
      const username = "Keanu_Reeves";
      final res = validateUsername(username);
      expect(res, null);
    });
  });

  group("Email", () {
    test("Invalid email", () {
      const email = "something wrong";
      final res = validateEmail(email);
      expect(res, EMAIL_ERROR.invalid);
    });

    test("Invalid email", () {
      const email = "something wrong";
      final res = validateEmail(email);
      expect(res, EMAIL_ERROR.invalid);
    });

    test("Valid email", () {
      const email = "peter@ign.com";
      final res = validateEmail(email);
      expect(res, null);
    });
  });

  group("Password", () {
    test("Missing special character", () {
      const password = "Ab12345678";
      final res = validatePassword(password);
      expect(res, [PASSWORD_ERROR.specialCharacter]);
    });
    test("Missing uppercase character", () {
      const password = ".d12345678";
      final res = validatePassword(password);
      expect(res, [PASSWORD_ERROR.uppercase]);
    });
    test("Password with length > 8", () {
      const password = "Ab1.2";
      final res = validatePassword(password);
      expect(res, [PASSWORD_ERROR.length]);
    });
    test("Valid password", () {
      const password = "Ab12345678.";
      final res = validatePassword(password);
      expect(res, []);
    });
  });
}
