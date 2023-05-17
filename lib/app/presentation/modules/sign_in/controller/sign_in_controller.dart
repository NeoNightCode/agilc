import '../../../../data/services/local/secret_salt_provider.dart';
import '../../../../domain/either/either.dart';
import '../../../../domain/failures/sign_in/sign_in_failure.dart';
import '../../../../domain/models/user/user.dart';
import '../../../../domain/repositories/authentication_repository.dart';
import '../../../global/state_notifier.dart';
import 'state/sign_in_state.dart';

class SignInController extends StateNotifier<SignInState> {
  SignInController(
    super.state, {
    required this.autheticationRepository,
    required this.secretSaltProvider,
  });

  final AutheticationRepository autheticationRepository;

  final SecretSaltProvider secretSaltProvider;

  void onUsernameChanged(String text) {
    onlyUpdate(
      state.copyWith(
        username: text.trim().toLowerCase(),
      ),
    );
  }

  void onPasswordChanged(String text) {
    onlyUpdate(
      state.copyWith(
        password: text.replaceAll(' ', ''),
      ),
    );
  }

  Future<Either<SignInFailure, User>> submit() async {
    state = state.copyWith(fetching: true);

    final hashedPassword = secretSaltProvider.hashPassword(
        state.password, secretSaltProvider.secretSalt);

    final result = await autheticationRepository.signIn(
      state.username,
      hashedPassword,
    );

    result.when(
      left: (_) => state = state.copyWith(fetching: false),
      right: (_) => null,
    );

    return result;
  }
}
