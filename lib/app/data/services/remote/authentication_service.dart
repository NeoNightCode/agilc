import '../../../domain/either/either.dart';
import '../../../domain/failures/sign_in/sign_in_failure.dart';
import '../../http/http.dart';

class AuthenticationService {
  AuthenticationService(this._http);

  final Http _http;

  Either<SignInFailure, String> _handleFailure(HttpFailure failure) {
    if (failure.statusCode != null) {
      switch (failure.statusCode!) {
        case 401:
          return Either.left(
            SignInFailure.unauthorized(),
          );
        case 404:
          return Either.left(
            SignInFailure.notFound(),
          );
        default:
          return Either.left(
            SignInFailure.unknown(),
          );
      }
    }
    if (failure.exception is NetworkException) {
      return Either.left(
        SignInFailure.network(),
      );
    }
    return Either.left(
      SignInFailure.unknown(),
    );
  }

  Future<Either<SignInFailure, String>> getRefreshToken({
    required String username,
    required String password,
  }) async {
    final result = await _http.request(
      '/login',
      onSuccess: (responseBody) {
        final json = responseBody as Map;
        return json['refresh_token'] as String;
      },
      method: HttpMethod.post,
      body: {
        'email': username,
        'password': password,
      },
    );
    return result.when(
      left: _handleFailure,
      right: (refreshToken) => Either.right(
        refreshToken,
      ),
    );
  }

  Future<Either<SignInFailure, String>> getAccessToken({
    required String refreshToken,
  }) async {
    final result = await _http.request(
      '/access_token',
      onSuccess: (responseBody) {
        final json = responseBody as Map;
        return json['access_token'] as String;
      },
      method: HttpMethod.post,
      queryParameters: {
        'refresh_token': refreshToken,
      },
    );
    return result.when(
      left: _handleFailure,
      right: (accessToken) => Either.right(
        accessToken,
      ),
    );
  }
}
