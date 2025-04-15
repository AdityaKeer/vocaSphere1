import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_shadow/simple_shadow.dart';

class JapaneseCard extends StatelessWidget {
  const JapaneseCard({
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
    return GestureDetector(
      onTap: () async {
        await flutterTts.setLanguage(lang);
        await flutterTts.setSpeechRate(0.20);
        await flutterTts.speak(letter);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        shadowColor: Colors.grey.shade600,
        color: Colors.blue.shade50,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        letter,
                        style: TextStyle(color: Colors.black, fontSize: 198),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  'Pronunciation: $pronun',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blueGrey.shade900,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 6,
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Icon(
                                  CupertinoIcons.speaker_3_fill,
                                  color: Colors.blueAccent,
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
