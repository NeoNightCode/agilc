import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecretSaltProvider with ChangeNotifier {
  String? _secretSalt;

  String? get secretSalt => _secretSalt;

  Future<void> fetchSecretSalt([String? secretSalt]) async {
    const storage = FlutterSecureStorage();

    String? existingSecretSalt = await storage.read(key: 'secret_salt');

    if (existingSecretSalt == null && secretSalt != null) {
      await storage.write(key: 'secret_salt', value: secretSalt);
      existingSecretSalt = secretSalt;
    }

    _secretSalt = existingSecretSalt;
    notifyListeners();
  }

  String hashPassword(String password, String? secretSalt) {
    final key = utf8.encode(password);
    final bytes = utf8.encode(secretSalt ?? '');

    final hmac = Hmac(sha256, key);
    final digest = hmac.convert(bytes);

    return digest.toString();
  }
}
