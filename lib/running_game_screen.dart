import 'dart:async';

import 'package:fidibo_paper/choose.dart';
import 'package:fidibo_paper/coordinates.dart';
import 'package:fidibo_paper/responsive.dart';
import 'package:fidibo_paper/square.dart';
import 'package:flutter/material.dart';

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
    squaresList = widget.squaresList;
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
    );
  }

  bool isGameFinished = false;

  void onFrameReceived() {
    for (int i = 0; i < squaresList.length; i++) {
      onFrameReceivedInSquare(squaresList[i], squaresList.sublist(i + 1));
    }
    setState(() {});
    bool isSquaresCollide = false;
    for (int i = 0; i < squaresList.length; i++) {
      innerLoop:
      for (int j = i + 1; j < squaresList.length; j++) {
        if (doSquaresCollide(squaresList[i], squaresList[j])) {
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
      setState(() => isGameFinished = true);
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

  bool doSquaresCollide(Square firstSquare, Square secondSquare) {
    if ((firstSquare.topLeftCorner.x + firstSquare.size) >= secondSquare.topLeftCorner.x &&
        firstSquare.topLeftCorner.x <= (secondSquare.topLeftCorner.x + secondSquare.size)) {
      if ((firstSquare.topLeftCorner.y + firstSquare.size) >= secondSquare.topLeftCorner.y &&
          firstSquare.topLeftCorner.y <= (secondSquare.topLeftCorner.y + secondSquare.size)) {
        return true;
      }
    }
    return false;
  }

  Widget buildSquare(Square square) {
    return Positioned(
      left: isGameFinished ? 0 : square.topLeftCorner.x.toDouble(),
      top: isGameFinished ? 0 : square.topLeftCorner.y.toDouble(),
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 900),
          width: isGameFinished ? Responsive.width(context) : square.size.toDouble(),
          height: isGameFinished ? Responsive.height(context) : square.size.toDouble(),
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
