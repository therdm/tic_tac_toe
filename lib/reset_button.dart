import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/board_brain.dart';

class ResetButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: Provider.of<BoardBrain>(context, listen: false).resetBoard,
      color: Colors.blue,
      child: Text(
        Provider.of<BoardBrain>(context).isStopBoard ? 'PLAY AGAIN' : 'RESET',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
//
