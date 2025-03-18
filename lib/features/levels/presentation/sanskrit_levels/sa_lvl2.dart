import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../components/letter_card.dart';

class SaLvl2 extends StatefulWidget {
  const SaLvl2({super.key});

  @override
  State<SaLvl2> createState() => _SaLvl2State();
}

class _SaLvl2State extends State<SaLvl2> {
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
                  letter: 'क',
                  pronun: 'Ka',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'ख',
                  pronun: 'KHa',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'ग',
                  pronun: 'Ga',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'घ',
                  pronun: 'GHA',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'ङ',
                  pronun: 'unga',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'च',
                  pronun: 'CA',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'छ',
                  pronun: 'CHHA',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'ज',
                  pronun: 'JA',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'झ',
                  pronun: 'JHA',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'ञ',
                  pronun: 'NYA',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'ट',
                  pronun: 'TA',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'ठ',
                  pronun: 'THH',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'ड',
                  pronun: 'DA',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'ढ',
                  pronun: 'DHA',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'ण',
                  pronun: 'N',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'त',
                  pronun: 'T',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'थ',
                  pronun: 'THA',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'द',
                  pronun: 'D',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'ध',
                  pronun: 'DHA',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'न',
                  pronun: 'NA',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'प',
                  pronun: 'P',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'फ',
                  pronun: 'FA',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'ब',
                  pronun: 'B',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'भ',
                  pronun: 'BHA',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'म',
                  pronun: 'MA',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'य',
                  pronun: 'Y',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'र',
                  pronun: 'R',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'ल',
                  pronun: 'LA',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'व',
                  pronun: 'V',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'श',
                  pronun: 'SHA',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'ष',
                  pronun: 'SHHA',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'स',
                  pronun: 'SA',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'ह',
                  pronun: 'HA',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'क्ष',
                  pronun: 'KSH',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'त्र',
                  pronun: 'TRA',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "mr-IN",
                  letter: 'ज्ञ',
                  pronun: 'GYA',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
