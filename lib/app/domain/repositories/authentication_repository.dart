import '../either/either.dart';
import '../enums/enums.dart';
import '../models/user.dart';

abstract class AutheticationRepository {
  Future<bool> get isSignedIn;
  Future<User?> getUserData();
  Future<void> signOut();
  Future<Either<SigInFailure, User>> signIn(
    String username,
    String password,
  );
}
