import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Home Page'),
            ElevatedButton(
              onPressed: () {
                context.beamToNamed('/characters');
              },
              child: const Text('Go to characters list'),
            ),
          ],
        ),
      ),
    );
  }
}
