import 'package:beamer/beamer.dart';
import 'package:flavor_test/characters/character_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flavor_test/services/riverpod_characters.dart';

class CharacterDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pathParameter = Beamer.of(context).currentLocation.state.pathParameters['characterId'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character 123'),
      ),
      body: Center(
        child: Beamer.of(context).currentLocation.state.data.containsKey('character')
            ? CharacterDetailsWidget(Beamer.of(context).currentLocation.state.data['character'])
            : Consumer(
                builder: (context, watch, child) {
                  final character = watch(uniqueCharacterProvider(int.tryParse('$pathParameter')!));
                  return character.when(
                    data: (character) => CharacterDetailsWidget(character),
                    loading: () => const CircularProgressIndicator(),
                    error: (error, _) => Text(error.toString()),
                  );
                },
              ),
      ),
    );
  }
}

class CharacterDetailsWidget extends StatelessWidget {
  const CharacterDetailsWidget(this.character);
  final Character character;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(character.name),
    );
  }
}
