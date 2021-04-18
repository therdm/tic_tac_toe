import 'package:flutter/material.dart';

class UserScore extends StatelessWidget {
  UserScore({
    @required this.name,
    @required this.theme,
    @required this.scoreCount,
    @required this.scoreBackColor,
    @required this.scoreTextColor,
    @required this.titleBackColor,
  });

  final ThemeData theme;
  final String name;
  final int scoreCount;
  final Color titleBackColor;
  final Color scoreBackColor;
  final Color scoreTextColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: titleBackColor),
                color: titleBackColor,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: FittedBox(
                child: Text(
                  getName(name),
                  style:
                      theme.textTheme.headline5.copyWith(color: Colors.white),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: titleBackColor),
                color: scoreBackColor,
              ),
              alignment: Alignment.center,
              child: Text(
                '$scoreCount',
                style: theme.textTheme.headline2.copyWith(
                  color: scoreTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getName(String name) =>
      (name.length <= 8) ? name : name.substring(0, 7) + '...';
}
