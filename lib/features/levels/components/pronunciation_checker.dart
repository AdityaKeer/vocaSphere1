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

class _PronunciationCheckerState extends State<PronunciationChecker>
    with SingleTickerProviderStateMixin {
  final FlutterTts flutterTts = FlutterTts();
  stt.SpeechToText speechToText = stt.SpeechToText();
  String userSpeech = "";
  double? accuracy;

  bool isListening = false;
  bool isSpeaking = false; // for speaker glow
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    flutterTts.setCompletionHandler(() {
      setState(() {
        isSpeaking = false; // stop glow after TTS completes
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void startListening() async {
    bool available = await speechToText.initialize(debugLogging: true);

    if (available) {
      setState(() {
        isListening = true;
      });

      speechToText.listen(
        onSoundLevelChange: (level) {},
        onResult: (result) {
          setState(() {
            userSpeech = result.recognizedWords;
          });

          // Automatically check after speaking
          checkSimilarity(result.recognizedWords, widget.correctWord);

          setState(() {
            isListening = false;
          });
        },
        localeId: widget.lang,
        listenFor: Duration(seconds: 7),
        pauseFor: Duration(seconds: 3),
        cancelOnError: false,
      );
    }
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {
      isListening = false;
    });
  }

  void checkSimilarity(String userWord, String actualWord) {
    double result = ratio(userWord, actualWord).toDouble();
    setState(() {
      accuracy = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🔊 Speaker Button with Glow
            GestureDetector(
              onTap: () async {
                setState(() {
                  isSpeaking = true;
                });
                await flutterTts.setLanguage(widget.lang);
                await flutterTts.setSpeechRate(0.20);
                await flutterTts.speak(widget.pronunciation);
              },
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  double glow = 1 + (_animationController.value * 0.1);
                  return Transform.scale(
                    scale: isSpeaking ? glow : 1,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 50,
                      ),
                      decoration: BoxDecoration(
                        color:
                            isSpeaking ? Colors.greenAccent : Colors.blueAccent,
                        borderRadius: BorderRadius.circular(90),
                        boxShadow:
                            isSpeaking
                                ? [
                                  BoxShadow(
                                    color: Colors.greenAccent.withAlpha(
                                      (0.6 * 255).toInt(),
                                    ),
                                    spreadRadius: 10,
                                    blurRadius: 20,
                                  ),
                                ]
                                : [],
                      ),
                      child: Icon(
                        MingCute.volume_fill,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(width: 20),

            // 🎤 Mic Button with Glow
            GestureDetector(
              onLongPress: startListening,
              onLongPressEnd: (details) => stopListening(),
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  double glow = 1 + (_animationController.value * 0.1);
                  return Transform.scale(
                    scale: isListening ? glow : 1,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 50,
                      ),
                      decoration: BoxDecoration(
                        color:
                            isListening ? Colors.redAccent : Colors.blueAccent,
                        borderRadius: BorderRadius.circular(90),
                        boxShadow:
                            isListening
                                ? [
                                  BoxShadow(
                                    color: Colors.redAccent.withAlpha(
                                      (0.6 * 255).toInt(),
                                    ),
                                    spreadRadius: 10,
                                    blurRadius: 20,
                                  ),
                                ]
                                : [],
                      ),
                      child: Icon(ZondIcons.mic, size: 40, color: Colors.white),
                    ),
                  );
                },
              ),
            ),
          ],
        ),

        SizedBox(height: 20),

        // 📣 Display spoken words
        FittedBox(
          fit: BoxFit.contain,
          child: Text(
            "You said: $userSpeech",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 20),

        // ✅ Accuracy display
        ElevatedButton(
          style: ButtonStyle(enableFeedback: false),
          onPressed: null,
          child: Text(
            accuracy != null
                ? "Accuracy: ${accuracy!.toStringAsFixed(2)} %"
                : "Say something...",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
