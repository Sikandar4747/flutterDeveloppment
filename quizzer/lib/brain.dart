import 'question.dart';

class Brain {
  int _counter = 0;
  List<Question> _qbank = [
    Question(q: 'Raptor is not dumb', a: false),
    Question(q: 'Raptor is our lord and saviour', a: true),
    Question(q: 'weebs are animals', a: true),
    Question(q: 'The developer of this app is dumb', a: false),
    Question(q: 'Tchonky is nuub', a: true),
    Question(q: 'Raptor sucks at siege', a: false),
    Question(q: 'Tchonky sucks at siege', a: false),
    Question(q: 'Some cats are actually allergic to humans', a: true),
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Question(q: 'A slug\'s blood is green.', a: true),
    Question(q: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', a: true),
    Question(q: 'It is illegal to pee in the Ocean in Portugal.', a: true),
  ];
  void nextQ() {
    if (_counter < _qbank.length - 1) {
      _counter++;
    }
  }

  String GetquestionText() {
    return _qbank[_counter].txt;
  }

  bool GetquestionAn() {
    return _qbank[_counter].an;
  }

  bool isFinished() {
    if (_counter == _qbank.length - 1) {
      print("finished");
      return true;
    } else {
      print("Not : $_counter");
      return false;
    }
  }

  void reset() {
    _counter = 0;
  }
}
