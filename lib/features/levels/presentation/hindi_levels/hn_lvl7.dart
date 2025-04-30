import 'dart:math'; // For random number generation
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:major_project1/features/levels/components/pronunciation_checker.dart';

class HnLvl7 extends StatefulWidget {
  const HnLvl7({super.key});

  @override
  State<HnLvl7> createState() => _HnLvl7State();
}

class _HnLvl7State extends State<HnLvl7> {
  List<dynamic>? data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    // Access Firestore collection
    CollectionReference wordsCollection = FirebaseFirestore.instance.collection(
      'hnWords',
    );

    // Get the total number of documents
    QuerySnapshot snapshot = await wordsCollection.get();
    int totalDocuments =
        snapshot.size; // Total number of documents in the collection

    if (totalDocuments > 0) {
      // Generate a random index based on total number of documents
      Random random = Random();
      int randomIndex = random.nextInt(totalDocuments);

      // Query document with a specific random index
      QuerySnapshot randomSnapshot =
          await wordsCollection
              .where('id', isEqualTo: randomIndex)
              .limit(1) // Ensure you only get one document
              .get();

      // If there is a document with the random index, update UI
      if (randomSnapshot.docs.isNotEmpty) {
        var randomDoc = randomSnapshot.docs[0];
        setState(() {
          data = [
            {'word': randomDoc['word'], 'definition': randomDoc['definition']},
          ];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Level 7')),
      floatingActionButton: FloatingActionButton(
        child: Icon(LineAwesome.random_solid),
        onPressed: () {
          fetchData(); // Fetch a random document
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Row for Icon and Word
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(MingCute.translate_2_fill, size: 40),
                    SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        data?[0]?["word"] ?? "",
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40),

                // Definition
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    data?[0]?["definition"] ?? " ",
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                ),

                SizedBox(height: 60),

                // Pronunciation Checker
                PronunciationChecker(
                  correctWord: data?[0]?["word"] ?? " ",
                  lang: "hi-IN",
                  pronunciation: data?[0]?["word"] ?? " ",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
