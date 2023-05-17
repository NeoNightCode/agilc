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
    required String nombre,
    required String isla,
    required List<Luchador> luchadores,
    required List<Directivo> directivos,
    @JsonKey(name: 'image') required String imagePath,
  }) = _Team;

  factory Team.fromJson(Json json) => _$TeamFromJson(json);
}
