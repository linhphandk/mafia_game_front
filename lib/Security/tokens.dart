import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum TokenType { accessToken, refreshToken }

void saveTokens(String accessToken, String refreshToken,
    FlutterSecureStorage secureStorage) {
  secureStorage.write(key: TokenType.accessToken.name, value: accessToken);
  secureStorage.write(key: TokenType.accessToken.name, value: refreshToken);
}

