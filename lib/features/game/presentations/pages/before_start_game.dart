import 'dart:math';

import 'package:collection/collection.dart';
import 'package:fidibo_paper/features/game/presentations/managers/before_start_game_cubit.dart';
import 'package:fidibo_paper/features/game/presentations/managers/before_start_game_state.dart';
import 'package:fidibo_paper/features/game/domain/entities/choose.dart';
import 'package:fidibo_paper/application/constants.dart';
import 'package:fidibo_paper/features/game/domain/entities/coordinates.dart';
import 'package:fidibo_paper/features/game/domain/entities/direction_move.dart';
import 'package:fidibo_paper/commons/responsive.dart';
import 'package:fidibo_paper/features/game/domain/entities/square.dart';
import 'package:fidibo_paper/commons/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';

class BeforeStartGame extends StatefulWidget {
  const BeforeStartGame({Key? key}) : super(key: key);

  static Widget wrappedRoute() {
    return BlocProvider(create: (ctx) => GetIt.instance<BeforeStartGameCubit>(), child: const BeforeStartGame());
  }

  @override
  _BeforeStartGameState createState() => _BeforeStartGameState();
}

class _BeforeStartGameState extends State<BeforeStartGame> {
  List<Square> squaresList = [];
  final double acceptFrameRatio = 0.78;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => buildSquares());
    super.initState();
  }

  void buildSquares() {
    var xCoordinate = Responsive.width(context) * 0.17 - 60.0;
    var yCoordinate = Responsive.height(context) - 140.0;
    List.generate(5, (index) {
      squaresList.add(Square(
        id: index,
        topLeftCorner: Coordinates(x: xCoordinate, y: yCoordinate),
        size: SQUARE_SIZE,
        directionMove: DirectionMove.values[Random().nextInt(DirectionMove.values.length)],
        choose: Choose.rock,
      ));
      xCoordinate = xCoordinate + 4;
      yCoordinate = yCoordinate + 4;
    });
    xCoordinate = Responsive.width(context) * 0.52 - 60.0;
    yCoordinate = Responsive.height(context) - 140.0;
    List.generate(5, (index) {
      squaresList.add(Square(
        id: 5 + index,
        topLeftCorner: Coordinates(x: xCoordinate, y: yCoordinate),
        size: SQUARE_SIZE,
        directionMove: DirectionMove.values[Random().nextInt(DirectionMove.values.length)],
        choose: Choose.paper,
      ));
      xCoordinate = xCoordinate + 4;
      yCoordinate = yCoordinate + 4;
    });
    xCoordinate = Responsive.width(context) * 0.87 - 60.0;
    yCoordinate = Responsive.height(context) - 140.0;
    List.generate(5, (index) {
      squaresList.add(Square(
        id: 10 + index,
        topLeftCorner: Coordinates(x: xCoordinate, y: yCoordinate),
        size: SQUARE_SIZE,
        directionMove: DirectionMove.values[Random().nextInt(DirectionMove.values.length)],
        choose: Choose.scissors,
      ));
      xCoordinate = xCoordinate + 4;
      yCoordinate = yCoordinate + 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: Responsive.height(context) * acceptFrameRatio,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.green, width: 3),
                ),
              ),
              ...squaresList.mapIndexed((index, square) => Positioned(
                    left: square.topLeftCorner.x,
                    top: square.topLeftCorner.y,
                    child: Draggable(
                      onDraggableCanceled: (_, offset) {
                        final RenderBox box = context.findRenderObject() as RenderBox;
                        final topLeftPosition = box.globalToLocal(offset);
                        if (topLeftPosition.dy < (MediaQuery.of(context).size.height * acceptFrameRatio) - (square.size - 24)) {
                          BlocProvider.of<BeforeStartGameCubit>(context).changeOneSquarePosition(squaresList[index]);
                          squaresList[index].setTopLeftCorner(Coordinates(x: offset.dx, y: offset.dy - 24));
                          setState(() {});
                        }
                      },
                      childWhenDragging: Container(),
                      feedback: buildGameSquare(square),
                      child: buildGameSquare(square),
                    ),
                  )),
              BlocBuilder<BeforeStartGameCubit, BeforeStartGameState>(
                builder: (context, state) {
                  bool isReadyToStart = state is ReadyToStart;
                  return AnimatedAlign(
                    alignment: Alignment(0.0, isReadyToStart ? -1.0 : -1.4),
                    curve: Curves.elasticOut,
                    duration: const Duration(milliseconds: 600),
                    child: Container(
                      height: 90,
                      width: double.infinity,
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () {
                          context.push('/running', extra: state.map(notReadyToStart: (_) => [], readyToStart: (state) => state.squares));
                        },
                        child: Text(
                          'شروع با ${state.map(notReadyToStart: (_) => 0, readyToStart: (state) => state.squares.length)} مهره',
                          textAlign: TextAlign.center,
                          style: defaultTextStyle(context, StyleText.wb2),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildGameSquare(Square square) {
    return Container(
        width: square.size,
        height: square.size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: square.choose.backgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(2, 2),
            )
          ],
        ),
        child: Image(
          image: AssetImage(square.choose.iconPath),
          height: square.size * 0.8,
          width: square.size * 0.8,
        ));
  }
}
