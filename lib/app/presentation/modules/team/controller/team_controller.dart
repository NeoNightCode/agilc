import '../../../../domain/models/team/team.dart';
import '../../../global/state_notifier.dart';
import 'state/team_state.dart';

class TeamController extends StateNotifier<TeamListState> {
  TeamController(
    super.state, {
    required this.team,
  });

  final Team team;

  void init() {
    state = TeamListState.loaded(team);
  }
}
