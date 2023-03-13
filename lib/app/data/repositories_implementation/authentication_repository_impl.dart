import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../domain/models/user.dart';
import '../../domain/repositories/authentication_repository.dart';

const _key = 'sessionId';

class AutheticationRepositoryImpl implements AutheticationRepository {
  final FlutterSecureStorage _secureStorage;

  AutheticationRepositoryImpl(
    this._secureStorage,
  );

  @override
  Future<User?> getUserData() {
    return Future.value(
      User(),
    );
  }

  @override
  Future<bool> get isSignedIn async {
    final sessionId = await _secureStorage.read(key: _key);
    return sessionId != null;
  }
}
