import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/board_brain.dart';

class TTTBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BoardBrain>(
      builder: (ctx, data, child) {
        return Container(
          width: data.boardWidth,
          height: data.boardWidth,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/tttbbg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: <Widget>[
              GridView.count(
                crossAxisCount: 3,
                children: List.generate(9, (index) {
                  return GestureDetector(
                    onTap: () {
                      if (!data.isStopBoard) data.onUserTap(index);
                    },
                    child: data.tttInputs[index],
                  );
                }),
              ),
              if (data.winStatus)
                CustomPaint(
                  size: Size(data.boardWidth, data.boardWidth),
                  painter: MyPainter(data.winLineP1, data.winLineP2),
                ),
            ],
          ),
        );
      },
    );
  }
}

class MyPainter extends CustomPainter {
  final point1, point2;
  MyPainter(this.point1, this.point2);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4;
    canvas.drawLine(point1, point2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
