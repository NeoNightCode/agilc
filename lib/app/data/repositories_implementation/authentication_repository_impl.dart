import '../../domain/either/either.dart';
import '../../domain/failures/sign_in/sign_in_failure.dart';
import '../../domain/models/user/user.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../services/local/access_token_service.dart';
import '../services/remote/account_service.dart';
import '../services/remote/authentication_service.dart';

class AutheticationRepositoryImpl implements AutheticationRepository {
  AutheticationRepositoryImpl(
    this._authenticationService,
    this._accessTokenService,
    this._accountService,
  );
  final AuthenticationService _authenticationService;
  final AccessTokenService _accessTokenService;
  final AccountService _accountService;

  @override
  Future<bool> get isSignedIn async {
    final refreshToken = await _accessTokenService.refreshToken;
    return refreshToken != null;
  }

  @override
  Future<Either<SignInFailure, User>> signIn(
    String username,
    String password,
  ) async {
    final loginResult = await _authenticationService.getRefreshToken(
        username: username, password: password);

    return loginResult.when(
      left: (failure) async => Either.left(failure),
      right: (refreshToken) async {
        await _accessTokenService.saveRefreshToken(refreshToken);

        final getAccesToken = await _authenticationService.getAccessToken(
          refreshToken: refreshToken,
        );
        return getAccesToken.when(
          left: (failure) => Either.left(failure),
          right: (accessToken) async {
            await _accessTokenService.saveAccessToken(accessToken);

            final user = await _accountService.getAccount(accessToken);

            if (user == null) {
              return Either.left(SignInFailure.unknown());
            }
            return Either.right(user);
          },
        );
      },
    );
  }

  @override
  Future<void> signOut() async {
    return _accessTokenService.signOut();
  }
}
