import 'package:flutter/material.dart';
import 'package:river_test_app/page.dart';
import 'package:river_test_app/scroll.dart';

import 'test.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TutorialCoachMark Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TextPage(),
    );
  }
}

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text "),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ScrollPage()),
            );
          },
          child: const Text("Tap"),
        ),
      ),
    );
  }
}
