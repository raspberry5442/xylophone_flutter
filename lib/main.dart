import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  Widget buildKey({int soundNum = 1, Color specifyColor = Colors.red}) {
    return Expanded(
      child: Container(
        color: specifyColor,
        child: TextButton(
          onPressed: () async {
            final player = AudioPlayer();
            await player.setSource(AssetSource('note$soundNum.wav'));
            await player.resume();
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
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildKey(soundNum: 1, specifyColor: Colors.red),
                buildKey(soundNum: 2, specifyColor: Colors.orange),
                buildKey(soundNum: 3, specifyColor: Colors.yellow),
                buildKey(soundNum: 4, specifyColor: Colors.green),
                buildKey(soundNum: 5, specifyColor: Colors.teal),
                buildKey(soundNum: 6, specifyColor: Colors.blue),
                buildKey(soundNum: 7, specifyColor: Colors.purple),
              ]),
        ),
      ),
    );
  }
}
