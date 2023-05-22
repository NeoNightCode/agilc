import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';

part 'matchup.freezed.dart';
part 'matchup.g.dart';

@freezed
class Matchup with _$Matchup {
  factory Matchup({
    @JsonKey(name: 'home_team') required String homeTeam,
    @JsonKey(name: 'home_team_image') required String homeTeamImage,
    @JsonKey(name: 'away_team') required String awayTeam,
    @JsonKey(name: 'away_team_image') required String awayTeamImage,
    required Results results,
    required DateTime date,
  }) = _Matchup;

  factory Matchup.fromJson(Json json) => _$MatchupFromJson(json);
}

@freezed
class Results with _$Results {
  factory Results({
    required bool done,
    @JsonKey(name: 'points_home_team') String? pointsHomeTeam,
    @JsonKey(name: 'points_away_team') String? pointsAwayTeam,
  }) = _Results;

  factory Results.fromJson(Json json) => _$ResultsFromJson(json);
}
