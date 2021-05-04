// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['name']);
  return Character()
    ..name = json['name'] as String
    ..gender = json['gender'] as String
    ..height = json['height'] as String
    ..mass = json['mass'] as String
    ..films = (json['films'] as List<dynamic>).map((e) => e as String).toList()
    ..homeworld = json['homeworld'] as String
    ..birthYear = json['birth_year'] as String;
}

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'height': instance.height,
      'mass': instance.mass,
      'films': instance.films,
      'homeworld': instance.homeworld,
      'birth_year': instance.birthYear,
    };
