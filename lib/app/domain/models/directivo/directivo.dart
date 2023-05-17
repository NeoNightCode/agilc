import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'directivo.g.dart';

@JsonSerializable()
class Directivo extends Equatable {
  const Directivo({
    required this.id,
    required this.name,
    required this.cargo,
    required this.imagePath,
    required this.age,
  });

  @JsonKey(name: '_id')
  final String id;

  @JsonKey(name: 'nombre')
  final String name;

  final String cargo;

  @JsonKey(name: 'image')
  final String imagePath;

  @JsonKey(name: 'edad')
  final int age;

  @override
  List<Object?> get props => [
        id,
        name,
        cargo,
        imagePath,
        age,
      ];

  Map<String, dynamic> toJson() => _$DirectivoToJson(this);

  factory Directivo.fromJson(Map<String, dynamic> json) =>
      _$DirectivoFromJson(json);
}
