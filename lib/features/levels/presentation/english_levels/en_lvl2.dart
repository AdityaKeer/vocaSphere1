import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../components/letter_card.dart';

class EnLvl2 extends StatefulWidget {
  const EnLvl2({super.key});

  @override
  State<EnLvl2> createState() => _EnLvl2State();
}

class _EnLvl2State extends State<EnLvl2> {
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
                  pronun: 'AA',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'इ',
                  pronun: 'E',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'ई',
                  pronun: 'I',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'उ',
                  pronun: 'U',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'ऊ',
                  pronun: 'OO',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'ए',
                  pronun: 'AE',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'ऐ',
                  pronun: 'AYE',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'ओ',
                  pronun: 'O',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'औ',
                  pronun: 'AO',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'अं',
                  pronun: 'UM',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'अः',
                  pronun: 'AHA',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'ऋ',
                  pronun: 'RI',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "en-US",
                  letter: 'ॠ',
                  pronun: 'RRI',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
