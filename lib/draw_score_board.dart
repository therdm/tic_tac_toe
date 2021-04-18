import 'package:flutter/material.dart';

class DrawScoreBoard extends StatelessWidget {
  const DrawScoreBoard({
    Key key,
    @required int drawScoreCount,
  })  : _scoreCount = drawScoreCount,
        super(key: key);

  final int _scoreCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      margin: EdgeInsets.only(
        top: 16,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Text(
        'DRAW    $_scoreCount',
        style: Theme.of(context).textTheme.headline6.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}
