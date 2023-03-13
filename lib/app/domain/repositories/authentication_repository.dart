import '../models/user.dart';

abstract class AutheticationRepository {
  Future<bool> get isSignedIn;
  Future<User?> getUserData();
}
