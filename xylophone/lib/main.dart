import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void ps(num) {
    final player = AudioCache();
    player.play('note$num.wav');
    print('button: $num');
  }

  Expanded sound({num, Color color}) {
    return Expanded(
      flex: 1,
      child: Container(
        color: color,
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            ps(num);
          },
          child: Text(''),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('XYLOPHONE'),
          ),
          backgroundColor: Colors.blue,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                sound(num: 1, color: Colors.amber),
                sound(num: 2, color: Colors.green),
                sound(num: 3, color: Colors.purple[400]),
                sound(num: 4, color: Colors.pink),
                sound(num: 5, color: Colors.orange),
                sound(num: 6, color: Colors.teal),
                sound(num: 7, color: Colors.deepPurple[900]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
