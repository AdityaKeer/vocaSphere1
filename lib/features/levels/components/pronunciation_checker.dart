import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:fuzzywuzzy/fuzzywuzzy.dart';

class PronunciationChecker extends StatefulWidget {
  final String correctWord;

  const PronunciationChecker({super.key, required this.correctWord});

  @override
  _PronunciationCheckerState createState() => _PronunciationCheckerState();
}

class _PronunciationCheckerState extends State<PronunciationChecker> {
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
        localeId: "en-US",
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
        GestureDetector(
          onLongPress: startListening,
          onLongPressEnd: (details) => stopListening(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "Hold to Speak",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          "You said: $userSpeech",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        ElevatedButton(
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
