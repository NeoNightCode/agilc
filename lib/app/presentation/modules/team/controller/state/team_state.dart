import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/enums.dart';
import '../../../../../domain/models/team/team.dart';

part 'team_state.freezed.dart';

@freezed
class TeamState with _$TeamState {
  factory TeamState.loading(Islas islas) = TeamStateLoading;
  factory TeamState.failed(Islas islas) = TeamStateFailed;
  factory TeamState.loaded({
    required Islas islas,
    required List<Team> teams,
  }) = TeamStateLoaded;
}
