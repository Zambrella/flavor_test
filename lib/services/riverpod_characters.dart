import 'dart:convert';

import 'package:flavor_test/characters/character_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final characterAPI = Provider((ref) => CharacterProvider());

final characterListProvider = FutureProvider<List<Character>>((ref) async {
  final charAPI = ref.read(characterAPI);
  return await charAPI.getAllCharacters();
});

final uniqueCharacterProvider = FutureProvider.family<Character, int>((ref, id) async {
  final charAPI = ref.read(characterAPI);
  return await charAPI.getCharacterById(id);
});

class CharacterProvider {
  static const api = 'https://swapi.dev/api/people';

  Future<List<Character>> getAllCharacters() async {
    try {
      final rawData = await http.get(Uri.parse(api));
      final jsonData = json.decode(rawData.body) as Map<String, dynamic>;
      return (jsonData['results'] as List).map((e) => Character.fromJson(e)).toList();
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  Future<Character> getCharacterById(int id) async {
    try {
      final rawData = await http.get(Uri.parse('$api/$id'));
      final jsonData = json.decode(rawData.body) as Map<String, dynamic>;
      return Character.fromJson(jsonData);
    } catch (e) {
      throw Exception(e);
    }
  }
}
