import 'package:freezed_annotation/freezed_annotation.dart';

part 'luchador.freezed.dart';
part 'luchador.g.dart';

@freezed
class Luchador with _$Luchador {
  const factory Luchador({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'nombre') required String name,
    @JsonKey(name: 'numero_ficha') required String numFicha,
    @JsonKey(name: 'categoria') required String category,
    @JsonKey(name: 'clasificacion') required String classification,
    @JsonKey(name: 'image') required String imagePath,
    @JsonKey(name: 'edad') required int age,
  }) = _Luchador;

  factory Luchador.fromJson(Map<String, dynamic> json) =>
      _$LuchadorFromJson(json);
}
