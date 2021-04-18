import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/board_brain.dart';
import 'package:tic_tac_toe/draw_score_board.dart';
import 'package:tic_tac_toe/icon_view.dart';
import 'package:tic_tac_toe/user_score.dart';

class ScoreBoard extends StatelessWidget {
  ScoreBoard({
    @required this.theme,
    @required this.userCrossName,
    @required this.userRoundName,
  });

  final ThemeData theme;
  final userCrossName;
  final userRoundName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        UserScore(
          theme: theme,
          scoreCount: Provider.of<BoardBrain>(context).crossScoreCount,
          name: userCrossName,
          titleBackColor: Colors.amber.shade900,
          scoreTextColor: Colors.amber.shade800,
          scoreBackColor: Colors.amber.shade100,
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconView(
                    icon: Icons.clear,
                    iconColor: Colors.amber.shade900,
                    borderColor: Colors.amber.shade800,
                  ),
                  Expanded(
                    child: Center(
                      child: Switch(
                        value: Provider.of<BoardBrain>(context).switchState,
                        activeColor: Colors.green.shade800,
                        inactiveThumbColor: Colors.amber.shade800,
                        inactiveTrackColor: Colors.amber.shade300,
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  IconView(
                    icon: Icons.radio_button_unchecked,
                    iconColor: Colors.green.shade900,
                    borderColor: Colors.green.shade800,
                  ),
                ],
              ),
              DrawScoreBoard(
                  drawScoreCount:
                      Provider.of<BoardBrain>(context).drawScoreCount),
            ],
          ),
        ),
        UserScore(
          theme: theme,
          scoreCount: Provider.of<BoardBrain>(context).roundScoreCount,
          name: userRoundName,
          titleBackColor: Colors.green.shade900,
          scoreTextColor: Colors.green.shade800,
          scoreBackColor: Colors.green.shade100,
        ),
      ],
    );
  }
}
