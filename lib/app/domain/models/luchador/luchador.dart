import 'package:freezed_annotation/freezed_annotation.dart';

part 'luchador.freezed.dart';
part 'luchador.g.dart';

@freezed
class Luchador with _$Luchador {
  const factory Luchador({
    @JsonKey(name: '_id') required String id,
    required String name,
    @JsonKey(name: 'registration_number') required String numFicha,
    required String category,
    required String classification,
    @JsonKey(name: 'image') required String imagePath,
    required int age,
  }) = _Luchador;

  factory Luchador.fromJson(Map<String, dynamic> json) =>
      _$LuchadorFromJson(json);
}
