import 'package:flutter/material.dart';
import 'package:tic_tac_toe/my_game_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EnterGameDetail(),
    );
  }
}

class EnterGameDetail extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _playerOneTEC = TextEditingController();
  final _playerTwoTEC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade900,
        centerTitle: false,
        title: Text(
          'TIC TAC TOE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  'Enter Players Detail',
                  style: Theme.of(context).textTheme.headline6,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.trim() == '')
                      return 'Please Enter Something';
                    else if (_playerOneTEC.text.trim() ==
                        _playerTwoTEC.text.trim())
                      return 'Please enter different names';
                    else
                      return null;
                  },
                  controller: _playerOneTEC,
                  decoration: InputDecoration(
                    labelText: 'Player 1',
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.trim() == '')
                      return 'Please Enter Something';
                    else if (_playerOneTEC.text.trim() ==
                        _playerTwoTEC.text.trim())
                      return 'Please enter different names';
                    else
                      return null;
                  },
                  controller: _playerTwoTEC,
                  decoration: InputDecoration(
                    labelText: 'Player 2',
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                FlatButton(
                  onPressed: () {
                    if (_formKey.currentState.validate())
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (ctx) {
                          return MyGamePage(
                            userCrossName: _playerOneTEC.text,
                            userRoundName: _playerTwoTEC.text,
                          );
                        }),
                      );
                  },
                  color: Colors.pink.shade900,
                  child: Text(
                    'CONTINUE',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
