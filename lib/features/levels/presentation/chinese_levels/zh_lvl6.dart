import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:icons_plus/icons_plus.dart';
import 'package:major_project1/features/levels/components/pronunciation_checker.dart';

class ZhLvl6 extends StatefulWidget {
  const ZhLvl6({super.key});

  @override
  State<ZhLvl6> createState() => _ZhLvl6State();
}

class _ZhLvl6State extends State<ZhLvl6> {
  List<dynamic?>? data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    const url = 'https://random-words-api.vercel.app/word/chinese';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    data = jsonDecode(body);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Level 6')),
      floatingActionButton: FloatingActionButton(
        child: Icon(LineAwesome.random_solid),
        onPressed: () {
          fetchData();
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
                  lang: "zh-CN",
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
