import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';
import '../matchup/matchup.dart';
import '../team/team.dart';

part 'competition.freezed.dart';
part 'competition.g.dart';

@freezed
class Competition with _$Competition {
  factory Competition({
    required String name,
    required String edition,
    required String category,
    required String classification,
    required List<Team> teams,
    required List<Fixtures> fixtures,
  }) = _Competition;

  factory Competition.fromJson(Json json) => _$CompetitionFromJson(json);
}

@freezed
class Fixtures with _$Fixtures {
  factory Fixtures({
    @JsonKey(name: '_id') required String id,
    required String name,
    required List<Matchup> matchups,
  }) = _Fixtures;

  factory Fixtures.fromJson(Json json) => _$FixturesFromJson(json);
}
