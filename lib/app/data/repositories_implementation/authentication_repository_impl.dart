import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../domain/either/either.dart';
import '../../domain/enums/enums.dart';
import '../../domain/models/user.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../services/remote/authentication_service.dart';

const _key = 'sessionId';

class AutheticationRepositoryImpl implements AutheticationRepository {
  AutheticationRepositoryImpl(
    this._secureStorage,
    this._authenticationService,
  );
  final FlutterSecureStorage _secureStorage;
  final AuthenticationService _authenticationService;

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

  @override
  Future<Either<SigInFailure, User>> signIn(
    String username,
    String password,
  ) async {
    final loginResult = await _authenticationService.getSessionId(
        username: username, password: password);

    return loginResult.when(
      (failure) async => Either.left(failure),
      (sessionId) async {
        await _secureStorage.write(
          key: _key,
          value: sessionId,
        );
        return Either.right(
          User(),
        );
      },
    );
  }

  @override
  Future<void> signOut() {
    return _secureStorage.delete(key: _key);
  }
}
