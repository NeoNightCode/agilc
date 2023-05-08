import '../../../domain/either/either.dart';
import '../../../domain/enums/enums.dart';
import '../../http/http.dart';

class AuthenticationService {
  AuthenticationService(this._http);

  final Http _http;

  Future<Either<SigInFailure, String>> getSessionId({
    required String username,
    required String password,
  }) async {
    final result = await _http.request(
      '/login',
      onSucces: (responseBody) {
        final json = responseBody as Map;
        return json['refresh_token'] as String;
      },
      method: HttpMethod.post,
      body: {
        'username': username,
        'password': password,
      },
    );
    return result.when(
      (failure) {
        if (failure.statusCode != null) {
          switch (failure.statusCode!) {
            case 401:
              return Either.left(SigInFailure.unauthorized);
            case 404:
              return Either.left(SigInFailure.notFound);
            default:
              return Either.left(SigInFailure.unknown);
          }
        }
        if (failure.exception is NetworkException) {
          return Either.left(SigInFailure.network);
        }
        return Either.left(SigInFailure.unknown);
      },
      (refreshToken) => Either.right(
        refreshToken,
      ),
    );
  }
}
