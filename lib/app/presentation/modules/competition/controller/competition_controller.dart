import '../../../../domain/enums.dart';
import '../../../../domain/repositories/competition_repository.dart';
import '../../../global/state_notifier.dart';
import 'state/competition_state.dart';

class CompetitionController extends StateNotifier<CompetitionState> {
  CompetitionController(
    super.state, {
    required this.competitionRepository,
  });
  final CompetitionRepository competitionRepository;

  Future<void> init() async {
    await loadCompetitions(CompetitionClassification.all);
  }

  void onClassificationChanged(
      CompetitionClassification competitionClassification) {
    if (state.competitionClassification != competitionClassification) {
      state = CompetitionState.loading(competitionClassification);
      loadCompetitions(CompetitionClassification.all);
    }
  }

  Future<void> loadCompetitions(
    loading, {
    CompetitionState? competitions,
  }) async {
    if (competitions != null) {
      state = competitions;
    }
    final result = await competitionRepository
        .getCompetitions(CompetitionClassification.all);
    state = result.when(
      left: (_) =>
          state = CompetitionState.failed(state.competitionClassification),
      right: (list) => state = CompetitionState.loaded(
        competitionClassification: state.competitionClassification,
        competitions: list,
      ),
    );
  }
}
