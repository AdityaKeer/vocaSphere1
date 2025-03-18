import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../components/letter_card.dart';

class JpLvl1 extends StatefulWidget {
  const JpLvl1({super.key});

  @override
  State<JpLvl1> createState() => _JpLvl1State();
}

class _JpLvl1State extends State<JpLvl1> {
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
                  lang: "ja-JP",
                  letter: 'あ',
                  pronun: 'a',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'い',
                  pronun: 'i',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'う',
                  pronun: 'u',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'え',
                  pronun: 'e',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'お',
                  pronun: 'o',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'か',
                  pronun: 'ka',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'き',
                  pronun: 'ki',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'く',
                  pronun: 'ku',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'け',
                  pronun: 'ke',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'こ',
                  pronun: 'ko',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'さ',
                  pronun: 'sa',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'し',
                  pronun: 'shi',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'す',
                  pronun: 'su',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'せ',
                  pronun: 'se',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'そ',
                  pronun: 'so',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'た',
                  pronun: 'ta',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ち',
                  pronun: 'chi',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'つ',
                  pronun: 'tsu',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'て',
                  pronun: 'te',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'と',
                  pronun: 'to',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'な',
                  pronun: 'na',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'に',
                  pronun: 'ni',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ぬ',
                  pronun: 'nu',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ね',
                  pronun: 'ne',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'の',
                  pronun: 'no',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'は',
                  pronun: 'ha',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ひ',
                  pronun: 'hi',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ふ',
                  pronun: 'fu',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'へ',
                  pronun: 'he',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ほ',
                  pronun: 'ho',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ま',
                  pronun: 'ma',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'み',
                  pronun: 'mi',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'む',
                  pronun: 'mu',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'め',
                  pronun: 'me',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'も',
                  pronun: 'mo',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
