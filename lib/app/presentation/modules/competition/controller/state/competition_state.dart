import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/enums.dart';
import '../../../../../domain/models/competition/competition.dart';

part 'competition_state.freezed.dart';

@freezed
class CompetitionState with _$CompetitionState {
  const factory CompetitionState.loading(
          CompetitionClassification competitionClassification) =
      CompetitionStateLoading;
  const factory CompetitionState.failed(
          CompetitionClassification competitionClassification) =
      CompetitionStateFailed;
  const factory CompetitionState.loaded({
    required CompetitionClassification competitionClassification,
    required List<Competition> competitions,
  }) = CompetitionStateLoaded;
}
