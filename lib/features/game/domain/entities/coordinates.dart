import 'package:equatable/equatable.dart';

class Coordinates extends Equatable {
  final double x;
  final double y;

  const Coordinates({
    required this.x,
    required this.y,
  });

  Coordinates moveCoordinates(Coordinates vector) => Coordinates(x: x + vector.x, y: y + vector.y);

  @override
  List<Object> get props => [x, y];
}
