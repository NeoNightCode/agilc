import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/matchup/matchup.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    @Default(
      LastMatchupsState.loading(),
    )
        LastMatchupsState matchups,
  }) = _HomeState;
}

@freezed
class LastMatchupsState with _$LastMatchupsState {
  const factory LastMatchupsState.loading() = LastMatchupsStateLoading;
  const factory LastMatchupsState.failed() = LastMatchupsStateFailed;
  const factory LastMatchupsState.loaded({
    required List<Matchup> matchups,
  }) = LastMatchupsStateLoaded;
}
