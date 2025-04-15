import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({
    super.key,
    required this.flutterTts,
    required this.lang,
    required this.number,
    required this.langNumWord,
    required this.pronun,
  });

  final FlutterTts flutterTts;
  final String lang;
  final int number;
  final String langNumWord;
  final String pronun;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await flutterTts.setLanguage(lang);
        await flutterTts.setSpeechRate(0.4);
        await flutterTts.speak(langNumWord);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 15,
        shadowColor: Colors.grey.shade600,
        color: Colors.blue.shade50,
        child: Stack(
          children: [
            Positioned(
              top: 10,
              right: 10,
              child: Icon(
                CupertinoIcons.speaker_3_fill,
                color: Colors.blueAccent,
                size: 40,
              ),
            ),
            // SizedBox(height: 20),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      '$number',
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      langNumWord,
                      style: TextStyle(
                        fontSize: 90,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: FittedBox(
                    fit: BoxFit.contain,
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
            ),
          ],
        ),
      ),
    );
  }
}
