import '../../domain/models/user.dart';
import '../../domain/repositories/authentication_repository.dart';

class AutheticationRepositoryImpl implements AutheticationRepository {
  @override
  Future<User?> getUserData() {
    return Future.value(
      User(),
    );
  }

  @override
  Future<bool> get isSignedIn {
    return Future.value(true);
  }
}
