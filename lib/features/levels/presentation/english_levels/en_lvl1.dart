import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../components/letter_card.dart';

class EnLvl1 extends StatefulWidget {
  const EnLvl1({super.key});

  @override
  State<EnLvl1> createState() => _EnLvl1State();
}

class _EnLvl1State extends State<EnLvl1> {
  final FlutterTts flutterTts = FlutterTts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.logout))],
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: 600.0,
            width: 500.0,
            child: PageView(
              scrollDirection: Axis.horizontal,
              children: [
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'A',
                  pronun: 'press sound icon',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'B',
                  pronun: 'press sound icon',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'C',
                  pronun: 'press sound icon',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'D',
                  pronun: 'press sound icon',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'E',
                  pronun: 'press sound icon',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'F',
                  pronun: 'press sound icon',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'G',
                  pronun: 'press sound icon',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'H',
                  pronun: 'press sound icon',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'I',
                  pronun: 'press sound icon',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'J',
                  pronun: 'press sound icon',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'K',
                  pronun: 'press sound icon',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'L',
                  pronun: 'press sound icon',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'M',
                  pronun: 'press sound icon',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'N',
                  pronun: 'press sound icon',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'O',
                  pronun: 'press sound icon',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'P',
                  pronun: 'press sound icon',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'Q',
                  pronun: 'press sound icon',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'R',
                  pronun: 'press sound icon',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'S',
                  pronun: 'press sound icon',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'T',
                  pronun: 'press sound icon',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'U',
                  pronun: 'press sound icon',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'V',
                  pronun: 'press sound icon',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'W',
                  pronun: 'press sound icon',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'X',
                  pronun: 'press sound icon',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'Y',
                  pronun: 'press sound icon',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'Z',
                  pronun: 'press sound icon',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
