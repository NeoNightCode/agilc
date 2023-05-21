import '../../../../domain/repositories/last_matchups_repository.dart';
import '../../../global/state_notifier.dart';
import 'state/home_state.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController(
    super.state, {
    required this.lastMatchupsRepository,
  });
  final LastMatchupsRepository lastMatchupsRepository;

  Future<void> init() async {
    await loadLastMatchups();
  }

  Future<void> loadLastMatchups({
    LastMatchupsState? matchups,
  }) async {
    if (matchups != null) {
      state = state.copyWith(
        matchups: matchups,
      );
    }
    final result = await lastMatchupsRepository.getLastMatchups();
    state = result.when(
      left: (_) => state.copyWith(
        matchups: const LastMatchupsState.failed(),
      ),
      right: (list) => state.copyWith(
        matchups: LastMatchupsState.loaded(
          matchups: list,
        ),
      ),
    );
  }
}
