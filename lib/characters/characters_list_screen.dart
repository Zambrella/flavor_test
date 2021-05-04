import 'package:flavor_test/services/riverpod_characters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:beamer/beamer.dart';

class CharactersListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
      ),
      body: Consumer(
        builder: (context, watch, child) {
          final characters = watch(characterListProvider);
          return characters.when(
            data: (characters) {
              return ListView.builder(
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // Beamer.of(context).currentLocation.update(
                      //       (state) => state.copyWith(
                      //         pathParameters: {'characterId': '${index + 1}'},
                      //         data: {
                      //           'character': characters[index],
                      //         },
                      //       ),
                      //     );
                      context.beamToNamed(
                        '/characters/${index + 1}',
                        data: {
                          'character': characters[index],
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(characters[index].name),
                    ),
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (errorMessage, _) => Text(errorMessage.toString()),
          );
        },
      ),
    );
  }
}
