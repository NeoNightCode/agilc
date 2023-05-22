import '../../../../domain/enums.dart';
import '../../../../domain/repositories/team_repository.dart';
import '../../../global/state_notifier.dart';
import 'state/team_state.dart';

class TeamController extends StateNotifier<TeamState> {
  TeamController(
    super.state, {
    required this.teamRepository,
  });

  final TeamRepository teamRepository;

  Future<void> init() async {
    await loadTeams(Islas.all);
  }

  void onIslaChanged(Islas islas) {
    if (state.islas != islas) {
      state = TeamState.loading(islas);
      loadTeams(Islas.all);
    }
  }

  Future<void> loadTeams(
    loading, {
    TeamState? competitions,
  }) async {
    if (competitions != null) {
      state = competitions;
    }
    final result = await teamRepository.getTeams(Islas.all);
    state = result.when(
      left: (_) => state = TeamState.failed(state.islas),
      right: (list) => state = TeamState.loaded(
        islas: state.islas,
        teams: list,
      ),
    );
  }
}
