import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:fuzzywuzzy/fuzzywuzzy.dart';

class PronunciationChecker extends StatefulWidget {
  final String lang;
  final String correctWord;
  final String pronunciation;

  const PronunciationChecker({
    super.key,
    required this.correctWord,
    required this.lang,
    required this.pronunciation,
  });

  @override
  _PronunciationCheckerState createState() => _PronunciationCheckerState();
}

class _PronunciationCheckerState extends State<PronunciationChecker> {
  final FlutterTts flutterTts = FlutterTts();
  stt.SpeechToText speechToText = stt.SpeechToText();
  String userSpeech = "";
  dynamic accuracy = 0.0;

  void startListening() async {
    bool available = await speechToText.initialize(
      debugLogging: true, // Enable debug logs
    );

    if (available) {
      speechToText.listen(
        onSoundLevelChange: (level) {},
        onResult: (result) {
          print("Recognized: ${result.recognizedWords}");
          setState(() {
            userSpeech = result.recognizedWords;
          });
        },
        localeId: "ja-JP",
        listenFor: Duration(seconds: 30),
        pauseFor: Duration(seconds: 10),
        cancelOnError: false,
      );
    } else {}
  }

  // Stop Listening
  Future<void> stopListening() async {
    await speechToText.stop();
  }

  dynamic checkSimilarity(String userWord, String actualWord) {
    accuracy = ratio(userWord, actualWord);
    return accuracy;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                await flutterTts.setLanguage(widget.lang);
                await flutterTts.setSpeechRate(0.20);
                await flutterTts.speak(widget.pronunciation);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(90),
                ),
                child: Icon(
                  MingCute.volume_fill,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onLongPress: startListening,
              onLongPressEnd: (details) => stopListening(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(90),
                ),
                child: Icon(ZondIcons.mic, size: 40, color: Colors.white),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        FittedBox(
          fit: BoxFit.contain,
          child: Text(
            "You said: $userSpeech",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          style: ButtonStyle(enableFeedback: false),
          onPressed: () {
            checkSimilarity(userSpeech, widget.correctWord);
            setState(() {});
          },
          child: Text(
            "Accuracy: $accuracy %",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
