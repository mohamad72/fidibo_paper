import 'package:fidibo_paper/square.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'before_start_game_state.freezed.dart';

@freezed
class BeforeStartGameState with _$BeforeStartGameState {
  const factory BeforeStartGameState.notReadyToStart() = NotReadyToStart;
  const factory BeforeStartGameState.readyToStart({required List<Square> squares}) = ReadyToStart;
}
