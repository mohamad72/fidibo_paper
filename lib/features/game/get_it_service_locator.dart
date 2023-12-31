import 'package:fidibo_paper/features/game/presentations/managers/before_start_game_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Cubit
  sl.registerFactory(() => BeforeStartGameCubit());
}
