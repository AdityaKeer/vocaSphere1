import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../components/letter_card.dart';

class JpLvl2 extends StatefulWidget {
  const JpLvl2({super.key});

  @override
  State<JpLvl2> createState() => _JpLvl2State();
}

class _JpLvl2State extends State<JpLvl2> {
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
                  letter: 'や',
                  pronun: 'ya',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ゆ',
                  pronun: 'yu',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'よ',
                  pronun: 'yo',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ら',
                  pronun: 'ra',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'り',
                  pronun: 'ri',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'る',
                  pronun: 'ru',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'れ',
                  pronun: 're',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ろ',
                  pronun: 'ro',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ゔ',
                  pronun: 'v',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ん',
                  pronun: 'n',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'わ',
                  pronun: 'wa',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ゐ',
                  pronun: 'wi',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ゑ',
                  pronun: 'we',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'を',
                  pronun: 'wo',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'が',
                  pronun: 'ga',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ぎ',
                  pronun: 'gi',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ぐ',
                  pronun: 'gu',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'げ',
                  pronun: 'ge',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ご',
                  pronun: 'ge',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ざ',
                  pronun: 'za',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'じ',
                  pronun: 'ji',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ず',
                  pronun: 'zu',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ぜ',
                  pronun: 'ze',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ぞ',
                  pronun: 'zo',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'だ',
                  pronun: 'da',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ぢ',
                  pronun: 'dji',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'づ',
                  pronun: 'dzu',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'で',
                  pronun: 'de',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ど',
                  pronun: 'do',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ば',
                  pronun: 'ba',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'び',
                  pronun: 'bi',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ぶ',
                  pronun: 'bu',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'べ',
                  pronun: 'be',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ぼ',
                  pronun: 'bo',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ぱ',
                  pronun: 'pa',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ぴ',
                  pronun: 'pi',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ぷ',
                  pronun: 'pu',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ぺ',
                  pronun: 'pe',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "ja-JP",
                  letter: 'ぽ',
                  pronun: 'po',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
