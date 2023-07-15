import 'package:fidibo_paper/app_routes.dart';
import 'package:fidibo_paper/features/game/presentations/pages/before_start_game.dart';
import 'package:fidibo_paper/application/light_theme.dart';
import 'package:fidibo_paper/features/game/presentations/pages/running_game_screen.dart';
import 'package:flutter/material.dart';
import 'package:fidibo_paper/features/game/get_it_service_locator.dart' as di_game;

void main() {
  setupGetIt();
  runApp(const MyApp());
}

void setupGetIt() async {
  di_game.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Fidibo Paper',
      theme: getLightTheme(),
      routerConfig: appRouter,
      localizationsDelegates: const [
        DefaultWidgetsLocalizations.delegate,
      ],
      builder: (_, child) => child == null ? const SizedBox() : Directionality(textDirection: TextDirection.rtl, child: child),
      debugShowCheckedModeBanner: false,
    );
  }
}
