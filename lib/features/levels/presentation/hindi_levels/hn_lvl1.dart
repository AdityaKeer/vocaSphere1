import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../components/letter_card.dart';

class HnLvl1 extends StatefulWidget {
  const HnLvl1({super.key});

  @override
  State<HnLvl1> createState() => _HnLvl1State();
}

class _HnLvl1State extends State<HnLvl1> {
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
                  lang: "mr-IN",
                  letter: 'अ',
                  pronun: 'A',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'आ',
                  pronun: 'AA',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'इ',
                  pronun: 'E',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'ई',
                  pronun: 'I',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'उ',
                  pronun: 'U',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'ऊ',
                  pronun: 'OO',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'ए',
                  pronun: 'AE',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'ऐ',
                  pronun: 'AYE',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'ओ',
                  pronun: 'O',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'औ',
                  pronun: 'AO',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'अं',
                  pronun: 'UM',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'अः',
                  pronun: 'AHA',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'ऋ',
                  pronun: 'RI',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
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
