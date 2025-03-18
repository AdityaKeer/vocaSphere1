import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class LetterCard extends StatelessWidget {
  const LetterCard({
    super.key,
    required this.flutterTts,
    required this.lang,
    required this.letter,
    required this.pronun,
  });

  final FlutterTts flutterTts;
  final String lang;
  final String letter;
  final String pronun;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 50,
      shadowColor: Colors.black,
      color: Colors.white,
      child: SizedBox(
        width: 350,
        height: 550,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 270.0, top: 10),
              child: InkWell(
                onTap: () async {
                  await flutterTts.setLanguage(lang);
                  await flutterTts.setSpeechRate(0.20);
                  await flutterTts.speak(letter, focus: true);
                },
                child: Icon(
                  CupertinoIcons.speaker_3_fill,
                  color: Colors.black,
                  size: 50,
                ),
              ),
            ),
            Text(
              letter,
              style: TextStyle(
                color: Colors.black,
                fontSize: 280,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Pronunciation : $pronun',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
