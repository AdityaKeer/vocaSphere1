import 'dart:math';

import 'package:flutter/material.dart';
import 'package:major_project1/features/levels/Models/item_model.dart';
import 'package:major_project1/features/levels/utilities/constants.dart';

class HnLvl4 extends StatefulWidget {
  const HnLvl4({super.key});

  @override
  State<HnLvl4> createState() => _HnLvl4State();
}

class _HnLvl4State extends State<HnLvl4> {
  late List<ItemModel> dataSource;
  late List<ItemModel> letters;
  late List<ItemModel> pronunciation;

  late int score;
  late bool gameOver;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initGame();
  }

  initGame() {
    score = 0;
    gameOver = false;

    dataSource = kHnAlphabets;

    letters = List.generate(
      8,
      (index) => dataSource[Random().nextInt(dataSource.length - 1)],
    );
    pronunciation = List<ItemModel>.from(letters);

    letters.shuffle();
    pronunciation.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    if (letters.isEmpty) {
      gameOver = true;
    }
    return Scaffold(
      appBar: AppBar(title: Text('Match the pairs '), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "Score : ", style: TextStyle(fontSize: 25.0)),
                  TextSpan(
                    text: "$score",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                    ),
                  ),
                ],
              ),
            ),
            if (!gameOver)
              Row(
                children: <Widget>[
                  Column(
                    children:
                        letters.map((item) {
                          return Container(
                            margin: const EdgeInsets.only(
                              left: 50.0,
                              right: 50.0,
                              bottom: 20.0,
                              top: 20.0,
                            ),
                            child: Draggable<ItemModel>(
                              data: item,
                              childWhenDragging: Text(
                                item.letter,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35.0,
                                ),
                              ),
                              feedback: Text(
                                item.letter,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35.0,
                                ),
                              ),
                              child: Text(
                                item.letter,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35.0,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                  Spacer(),
                  Column(
                    children:
                        pronunciation.map((item) {
                          return DragTarget<ItemModel>(
                            onAccept: (receivedItem) {
                              if (item.value == receivedItem.value) {
                                setState(() {
                                  letters.remove(receivedItem);
                                  pronunciation.remove(item);
                                  score += 10;
                                  item.accepting = false;
                                });
                              } else {
                                setState(() {
                                  score -= 5;
                                  item.accepting = false;
                                });
                              }
                            },
                            onLeave: (receivedItem) {
                              setState(() {
                                item.accepting = false;
                              });
                            },
                            onWillAccept: (receivedItem) {
                              setState(() {
                                item.accepting = true;
                              });
                              return true;
                            },
                            builder:
                                (context, candidateData, rejectedData) =>
                                    Container(
                                      color:
                                          item.accepting
                                              ? Colors.red
                                              : Colors.white,
                                      height: 50,
                                      width: 100,
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.only(
                                        left: 20.0,
                                        right: 50.0,
                                        bottom: 20.0,
                                        top: 20.0,
                                      ),
                                      child: Text(
                                        item.pnoun,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                          );
                        }).toList(),
                  ),
                ],
              ),
            if (gameOver)
              Text(
                'GameOver',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            if (gameOver)
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    initGame();
                    setState(() {});
                  },
                  child: Text('Restart', style: TextStyle(color: Colors.black)),
                ),
              ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.pop(context, BtnAction.backToLvls);
                });
              },
              child: Text('Go back'),
            ),
          ],
        ),
      ),
    );
  }
}

enum BtnAction { backToLvls, retryLvl, nextLvl }
