import 'package:fidibo_paper/coordinates.dart';
import 'package:fidibo_paper/wall.dart';

enum DirectionMove {
  top(Coordinates(x: 0, y: -1)),
  bottom(Coordinates(x: 0, y: 1)),
  right(Coordinates(x: 1, y: 0)),
  left(Coordinates(x: -1, y: 0)),
  topLeft(Coordinates(x: -1, y: -1)),
  bottomLeft(Coordinates(x: -1, y: 1)),
  topRight(Coordinates(x: 1, y: -1)),
  bottomRight(Coordinates(x: 1, y: 1));

  final Coordinates coordinates;

  const DirectionMove(this.coordinates);
}

extension DirectionMoveExtension on DirectionMove {
  DirectionMove getOppositeDirection() {
    final oppositeCoordinates = Coordinates(x: coordinates.x * (-1), y: coordinates.y * (-1));
    return DirectionMove.values.firstWhere((element) => element.coordinates == oppositeCoordinates);
  }

  DirectionMove getReflectionDirection(Wall collidedWall) {
    if (coordinates.x == 0 || coordinates.y == 0) return getOppositeDirection();
    Coordinates newCoordinates;
    if (collidedWall == Wall.left || collidedWall == Wall.right) {
      newCoordinates = Coordinates(x: coordinates.x, y: coordinates.y * (-1));
    } else {
      newCoordinates = Coordinates(x: coordinates.x * (-1), y: coordinates.y);
    }
    return DirectionMove.values.firstWhere((element) => element.coordinates == newCoordinates);
  }
}
