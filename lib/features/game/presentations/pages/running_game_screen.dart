import 'dart:async';

import 'package:fidibo_paper/commons/responsive.dart';
import 'package:fidibo_paper/features/game/domain/entities/choose.dart';
import 'package:fidibo_paper/features/game/domain/entities/coordinates.dart';
import 'package:fidibo_paper/features/game/domain/entities/square.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RunningGameScreen extends StatefulWidget {
  final List<Square> squaresList;

  const RunningGameScreen({required this.squaresList, Key? key}) : super(key: key);

  @override
  _RunningGameScreenState createState() => _RunningGameScreenState();
}

class _RunningGameScreenState extends State<RunningGameScreen> {
  List<Square> squaresList = [];

  @override
  void initState() {
    squaresList = widget.squaresList.toList();
    Timer.periodic(const Duration(milliseconds: 8), (timer) {
      onFrameReceived();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: squaresList.map((square) => buildSquare(square)).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        mini: false,
        onPressed: () => context.pop(),
        child: const Icon(Icons.restart_alt),
      ),
    );
  }

  void onFrameReceived() {
    for (int i = 0; i < squaresList.length; i++) {
      onFrameReceivedInSquare(squaresList[i], squaresList.sublist(i + 1));
    }
    setState(() {});
    bool isSquaresCollide = false;
    for (int i = 0; i < squaresList.length; i++) {
      innerLoop:
      for (int j = i + 1; j < squaresList.length; j++) {
        if (squaresList[i].doSquaresCollide(squaresList[j])) {
          final isWin = squaresList[i].choose.isWinnerInFightWith(squaresList[j].choose);
          isSquaresCollide = true;
          if (isWin == null) {
            squaresList[i].makeDirectionOpposite();
            squaresList[j].makeDirectionOpposite();
            break innerLoop;
          }
          if (isWin) {
            squaresList[i].makeDirectionOpposite();
            squaresList.removeAt(j);
            break innerLoop;
          }
          squaresList[j].makeDirectionOpposite();
          squaresList.removeAt(i);
        }
      }
    }
    if (squaresList.length == 1) {
      return;
    }
    if (isSquaresCollide) {
      setState(() {});
    }
  }

  void onFrameReceivedInSquare(Square square, List<Square> otherSquare) {
    final height = Responsive.height(context);
    final width = Responsive.width(context);
    square.goToNextMove();
    if (square.isCollideToWall(Coordinates(x: width, y: height))) {
      square.makeDirectionReflection(Coordinates(x: width, y: height));
    }
    if (otherSquare.isEmpty) return;
  }

  Widget buildSquare(Square square) {
    return Positioned(
      left: square.topLeftCorner.x.toDouble(),
      top: square.topLeftCorner.y.toDouble(),
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 900),
          width: square.size.toDouble(),
          height: square.size.toDouble(),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: square.choose.backgroundColor,
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Image(
            image: AssetImage(square.choose.iconPath),
            height: square.size.toDouble() * 0.8,
            width: square.size.toDouble() * 0.8,
          )),
    );
  }
}
