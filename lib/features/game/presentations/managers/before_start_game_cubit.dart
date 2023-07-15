import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fidibo_paper/features/game/presentations/managers/before_start_game_state.dart';
import 'package:fidibo_paper/features/game/domain/entities/square.dart';

class BeforeStartGameCubit extends Cubit<BeforeStartGameState> {
  BeforeStartGameCubit() : super(const BeforeStartGameState.notReadyToStart());

  List<Square> acceptableSquares = [];

  Future<void> changeOneSquarePosition(Square square) async {
    acceptableSquares = {square, ...acceptableSquares}.toList();
    if (acceptableSquares.length < 2) {
      emit(const BeforeStartGameState.notReadyToStart());
      return;
    }
    emit(BeforeStartGameState.readyToStart(squares: acceptableSquares));
  }
}
