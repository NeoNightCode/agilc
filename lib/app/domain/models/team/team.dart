import 'package:freezed_annotation/freezed_annotation.dart';

import '../../typedefs.dart';
import '../directivo/directivo.dart';
import '../luchador/luchador.dart';

part 'team.freezed.dart';
part 'team.g.dart';

@freezed
class Team with _$Team {
  const factory Team({
    @JsonKey(name: '_id') required String id,
    required String name,
    required String island,
    required List<Luchador> fighters,
    required List<Directivo> personnel,
    @JsonKey(name: 'image') required String imagePath,
  }) = _Team;

  factory Team.fromJson(Json json) => _$TeamFromJson(json);
}
