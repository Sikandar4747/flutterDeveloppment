import 'package:flutter/material.dart';
import 'brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Brain brain = Brain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[800],
          title: Center(
            child: Text('Quizzler'),
          ),
        ),
       backgroundColor: Colors.teal[800],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  void checkAns(bool userPick) {
    setState(() {
      if (brain.GetquestionAn() == userPick) {
        print('user is right');
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        print('wrong');
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      bool endCheck;
      endCheck = brain.isFinished();
      brain.nextQ();
      if (endCheck == true) {
        brain.reset();
        scoreKeeper.clear();
        Alert(
          context: context,
          type: AlertType.info,
          title: "THANK YOU CAPTAIN OBVIUOS",
          buttons: [
            DialogButton(
              child: Text(
                "BAKA",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              color: Color.fromRGBO(0, 179, 134, 1.0),
              radius: BorderRadius.circular(0.0),
            ),
          ],
        ).show();
      }
    });
  }

  int right = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                brain.GetquestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.purple[600],
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkAns(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.purple[800],
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAns(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
