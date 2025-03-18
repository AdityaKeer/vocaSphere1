import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../components/letter_card.dart';

class HnLvl2 extends StatefulWidget {
  const HnLvl2({super.key});

  @override
  State<HnLvl2> createState() => _HnLvl2State();
}

class _HnLvl2State extends State<HnLvl2> {
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
                  lang: "hi-IN",
                  letter: 'क',
                  pronun: 'Ka',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'ख',
                  pronun: 'KHa',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'ग',
                  pronun: 'Ga',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'घ',
                  pronun: 'GHA',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'ङ',
                  pronun: 'unga',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'च',
                  pronun: 'CA',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'छ',
                  pronun: 'CHHA',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'ज',
                  pronun: 'JA',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'झ',
                  pronun: 'JHA',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'ञ',
                  pronun: 'NYA',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'ट',
                  pronun: 'TA',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'ठ',
                  pronun: 'THH',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'ड',
                  pronun: 'DA',
                ),

                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'ढ',
                  pronun: 'DHA',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'ण',
                  pronun: 'N',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'त',
                  pronun: 'T',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'थ',
                  pronun: 'THA',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'द',
                  pronun: 'D',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'ध',
                  pronun: 'DHA',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'न',
                  pronun: 'NA',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'प',
                  pronun: 'P',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'फ',
                  pronun: 'FA',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'ब',
                  pronun: 'B',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'भ',
                  pronun: 'BHA',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'म',
                  pronun: 'MA',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'य',
                  pronun: 'Y',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'र',
                  pronun: 'R',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'ल',
                  pronun: 'LA',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'व',
                  pronun: 'V',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'श',
                  pronun: 'SHA',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'ष',
                  pronun: 'SHHA',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'स',
                  pronun: 'SA',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'ह',
                  pronun: 'HA',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'क्ष',
                  pronun: 'KSH',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
                  letter: 'त्र',
                  pronun: 'TRA',
                ),
                LetterCard(
                  flutterTts: flutterTts,
                  lang: "hi-IN",
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
