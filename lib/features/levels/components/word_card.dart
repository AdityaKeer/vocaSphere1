import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class WordCard extends StatelessWidget {
  const WordCard({
    super.key,
    required this.flutterTts,
    required this.lang,
    required this.engWord,
    required this.langWord,
    required this.pronun,
  });

  final FlutterTts flutterTts;
  final String lang;
  final String engWord;
  final String langWord;
  final String pronun;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 10,
      shadowColor: Colors.grey.shade600,
      color: Colors.blue.shade50,
      child: SizedBox(
        width: 350,
        height: 550,
        child: Stack(
          children: [
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                onPressed: () async {
                  await flutterTts.setLanguage(lang);
                  await flutterTts.setSpeechRate(0.4);
                  await flutterTts.speak(langWord);
                },
                icon: Icon(
                  CupertinoIcons.speaker_3_fill,
                  color: Colors.blueAccent,
                  size: 40,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Text(
                  engWord,
                  style: TextStyle(
                    fontSize: 47,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrangeAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                langWord,
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'Pronun : $pronun',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey.shade900,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
