import '../../../domain/models/user/user.dart';
import '../../http/http.dart';

class AccountService {
  AccountService(this._http);

  final Http _http;

  Future<User?> getAccount(String accessToken) async {
    final result = await _http.request(
      '/account',
      queryParameters: {
        'access_token': accessToken,
      },
      onSuccess: (json) {
        return User.fromJson(json);
      },
    );
    return result.when(
      left: (_) => null,
      right: (user) => user,
    );
  }
}
