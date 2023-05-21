import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/team/team.dart';

part 'team_state.freezed.dart';

@freezed
class TeamListState with _$TeamListState {
  factory TeamListState.loading() = TeamListStateLoading;
  factory TeamListState.failed() = TeamListStateFailed;
  factory TeamListState.loaded(Team team) = TeamListStateLoaded;
}
