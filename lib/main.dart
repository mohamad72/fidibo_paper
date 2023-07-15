import 'package:fidibo_paper/before_start_game.dart';
import 'package:fidibo_paper/light_theme.dart';
import 'package:fidibo_paper/running_game_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fidibo Paper',
      theme: getLightTheme(),
      home: const BeforeStartGame(),
    );
  }
}
