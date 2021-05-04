import 'package:beamer/beamer.dart';
import 'package:flavor_test/characters/character_details_screen.dart';
import 'package:flavor_test/characters/characters_list_screen.dart';
import 'package:flavor_test/home/home_screen.dart';
import 'package:flutter/material.dart';

class CharacterLocation extends BeamLocation {
  CharacterLocation(BeamState state) : super(state);
  @override
  List<String> get pathBlueprints => [
        '/characters/:characterId',
      ];

  @override
  List<BeamPage> pagesBuilder(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: const ValueKey('homepage'),
        child: HomeScreen(),
      ),
      if (state.uri.pathSegments.contains('characters'))
        BeamPage(
          key: const ValueKey('characters}'),
          child: CharactersListScreen(),
        ),
      if (state.pathParameters.containsValue('characterId'))
        BeamPage(
          key: ValueKey('characterDetails-${state.pathParameters['characterId']}'),
          child: CharacterDetailsScreen(),
        )
    ];
  }
}
