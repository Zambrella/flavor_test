import 'package:json_annotation/json_annotation.dart';

part 'character_model.g.dart';

@JsonSerializable()
class Character {
  Character();
  // ignore: lines_longer_than_80_chars
  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);

  @JsonKey(required: true)
  late final String name;
  late final String gender;
  late final String height;
  late final String mass;
  late final List<String> films;
  late final String homeworld;
  @JsonKey(name: 'birth_year')
  late final String birthYear;

  Map<String, dynamic> toJson() => _$CharacterToJson(this);

  @override
  String toString() {
    return 'Character(name: $name, gender: $gender, height: $height, mass: $mass, films: $films, homeworld: $homeworld, birthYear: $birthYear)';
  }
}
