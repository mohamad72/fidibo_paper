import 'package:fidibo_paper/features/game/presentations/pages/before_start_game.dart';
import 'package:fidibo_paper/features/game/presentations/pages/running_game_screen.dart';
import 'package:fidibo_paper/features/game/domain/entities/square.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/beforeStart',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/beforeStart',
      builder: (context, state) => BeforeStartGame.wrappedRoute(),
    ),
    GoRoute(
      path: '/running',
      builder: (context, state) => RunningGameScreen(squaresList: state.extra! as List<Square>),
    ),
  ],
);
