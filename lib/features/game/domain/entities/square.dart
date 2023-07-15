import 'package:equatable/equatable.dart';
import 'package:fidibo_paper/features/game/domain/entities/choose.dart';
import 'package:fidibo_paper/features/game/domain/entities/coordinates.dart';
import 'package:fidibo_paper/features/game/domain/entities/direction_move.dart';
import 'package:fidibo_paper/features/game/domain/entities/wall.dart';

class Square extends Equatable {
  final int id;
  Coordinates topLeftCorner;
  final double size;
  DirectionMove directionMove;
  final Choose choose;

  Square({
    required this.id,
    required this.topLeftCorner,
    required this.size,
    required this.directionMove,
    required this.choose,
  });

  void makeDirectionOpposite() {
    directionMove = directionMove.getOppositeDirection();
  }

  void makeDirectionReflection(Coordinates maxCoordinates) {
    directionMove = directionMove.getReflectionDirection(whichCollideToWall(maxCoordinates)!);
  }

  Coordinates calculateNextMove() {
    return topLeftCorner.moveCoordinates(directionMove.coordinates);
  }

  void goToNextMove() {
    setTopLeftCorner(calculateNextMove());
  }

  Wall? whichCollideToWall(Coordinates maxCoordinates) {
    final nextStepCoordinates = calculateNextMove();
    final allowMaxTopLeftCoordinates = Coordinates(x: maxCoordinates.x - size, y: maxCoordinates.y - size);
    if (nextStepCoordinates.x < 0) return Wall.top;
    if (nextStepCoordinates.x > allowMaxTopLeftCoordinates.x) return Wall.bottom;
    if (nextStepCoordinates.y < 0) return Wall.left;
    if (nextStepCoordinates.y > allowMaxTopLeftCoordinates.y) return Wall.right;
    return null;
  }

  bool isCollideToWall(Coordinates maxCoordinates) {
    return whichCollideToWall(maxCoordinates) != null;
  }

  void setTopLeftCorner(Coordinates value) {
    topLeftCorner = value;
  }

  Square copyWith({
    int? id,
    Coordinates? topLeftCorner,
    double? size,
    DirectionMove? directionMove,
    Choose? choose,
  }) {
    return Square(
      id: id ?? this.id,
      topLeftCorner: topLeftCorner ?? this.topLeftCorner,
      size: size ?? this.size,
      directionMove: directionMove ?? this.directionMove,
      choose: choose ?? this.choose,
    );
  }

  bool doSquaresCollide(Square secondSquare) {
    if ((topLeftCorner.x + size) >= secondSquare.topLeftCorner.x && topLeftCorner.x <= (secondSquare.topLeftCorner.x + secondSquare.size)) {
      if ((topLeftCorner.y + size) >= secondSquare.topLeftCorner.y &&
          topLeftCorner.y <= (secondSquare.topLeftCorner.y + secondSquare.size)) {
        return true;
      }
    }
    return false;
  }

  @override
  List<Object> get props => [id];
}
