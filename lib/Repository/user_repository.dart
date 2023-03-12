import 'package:shared_preferences/shared_preferences.dart';

void saveUserData(String id, String username, String profileImage, SharedPreferences prefs) {
  prefs.setString("userId", id);
  prefs.setString("username",username);
  prefs.setString("profileImage",profileImage);
}
