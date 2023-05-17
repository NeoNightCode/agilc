import '../../domain/models/user/user.dart';
import '../../domain/repositories/account_repository.dart';
import '../services/local/access_token_service.dart';
import '../services/remote/account_service.dart';

class AccountRepositoryImpl implements AccountRepository {
  AccountRepositoryImpl(
    this._accountService,
    this._accessTokenService,
  );

  final AccountService _accountService;
  final AccessTokenService _accessTokenService;

  @override
  Future<User?> getUserData() async {
    final token = await _accessTokenService.refreshToken ?? '';
    return _accountService.getAccount(token);
  }
}
