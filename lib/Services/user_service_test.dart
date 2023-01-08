import 'package:mafia_game_front/Services/user_service.dart';
import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

void main() {
  group("Create User", () {
    test("User with an invalid username", () {
      final res = UserService()
          .createUser("  dsds  ", "test@test.com", "AB12345.", "AB12345.");
      expect(res, null);
    });
    test("User with an invalid password", () {
      final res = UserService()
          .createUser("test@test.com", "peter", "AB12345", "AB12345.");
      expect(res, null);
    });

    test("User with not matching password", () {
      final res = UserService()
          .createUser("test@test.com", "peter1234", "AB12345.", "AB12345");
      expect(res, null);
    });

    test("User with an invalid email", () {
      final res = UserService()
          .createUser("test@test", "peter1234", "AB12345.", "AB12345.");
      expect(res, null);
    });
    test("User creation", () {
      final res = UserService()
          .createUser("test@test.com", "peter1234", "AB12345.", "AB12345.");
      expect(res != null, true);
    });
  });
}
