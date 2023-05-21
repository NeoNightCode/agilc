import 'package:freezed_annotation/freezed_annotation.dart';

part 'directivo.freezed.dart';
part 'directivo.g.dart';

@freezed
class Directivo with _$Directivo {
  const factory Directivo({
    @JsonKey(name: '_id') required String id,
    required String name,
    required String position,
    @JsonKey(name: 'image') required String imagePath,
    required int age,
  }) = _Directivo;

  factory Directivo.fromJson(Map<String, dynamic> json) =>
      _$DirectivoFromJson(json);
}
