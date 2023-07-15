import 'package:fidibo_paper/before_start_game.dart';
import 'package:fidibo_paper/running_game_screen.dart';
import 'package:fidibo_paper/square.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/beforeStart',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/beforeStart',
      builder: (context, state) => const BeforeStartGame(),
    ),
    GoRoute(
      path: '/running',
      builder: (context, state) => RunningGameScreen(squaresList: state.extra! as List<Square>),
    ),
  ],
);
