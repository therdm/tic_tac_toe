import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/board_brain.dart';
import 'package:tic_tac_toe/reset_button.dart';
import 'package:tic_tac_toe/score_board.dart';
import 'package:tic_tac_toe/ttt_board.dart';

class MyGamePage extends StatelessWidget {
  final userRoundName;
  final userCrossName;

  MyGamePage({this.userRoundName = '', this.userCrossName = ''});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    final theme = Theme.of(context);
    return SafeArea(
      child: ChangeNotifierProvider.value(
        value: BoardBrain(MediaQuery.of(context).size.shortestSide - 8),
        child: Scaffold(
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                ScoreBoard(
                    theme: theme,
                    userCrossName: userCrossName,
                    userRoundName: userRoundName),
                SizedBox(height: 8),
                TTTBoard(),
                ResetButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
