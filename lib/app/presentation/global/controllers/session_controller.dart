import '../../../domain/models/user/user.dart';
import '../../../domain/repositories/authentication_repository.dart';
import '../state_notifier.dart';

class SessionController extends StateNotifier<User?> {
  SessionController({
    required this.autheticationRepository,
  }) : super(null);

  final AutheticationRepository autheticationRepository;

  void setUser(User user) {
    state = user;
  }

  Future<void> signOut() async {
    await autheticationRepository.signOut();
    onlyUpdate(null);
  }
}
