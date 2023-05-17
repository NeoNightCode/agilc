import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _refreshToken = 'refreshToken';
const _accessToken = 'accesToken';

class AccessTokenService {
  AccessTokenService(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  Future<String?> get refreshToken async {
    final refreshToken = await _secureStorage.read(key: _refreshToken);
    return refreshToken;
  }

  Future<String?> get accesToken async {
    final accesToken = await _secureStorage.read(key: _accessToken);
    return accesToken;
  }

  Future<void> saveRefreshToken(String refreshToken) {
    return _secureStorage.write(
      key: _refreshToken,
      value: refreshToken,
    );
  }

  Future<void> saveAccessToken(String accessToken) {
    return _secureStorage.write(
      key: _accessToken,
      value: accessToken,
    );
  }

  Future<void> signOut() async {
    await _secureStorage.delete(key: _refreshToken);
    await _secureStorage.delete(key: _accessToken);
  }
}
