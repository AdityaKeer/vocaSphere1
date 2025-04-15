import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:icons_plus/icons_plus.dart';
import 'package:major_project1/features/levels/components/pronunciation_checker.dart';

class TrialApi extends StatefulWidget {
  const TrialApi({super.key});

  @override
  State<TrialApi> createState() => _TrialApiState();
}

class _TrialApiState extends State<TrialApi> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  List<dynamic?>? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Trial')),
      floatingActionButton: FloatingActionButton(
        child: Icon(LineAwesome.random_solid),
        onPressed: () {
          fetchData();
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              Icon(MingCute.translate_2_fill, size: 50),
              Text(
                ':',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
              Text(
                data?[0]["word"] ?? "",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 50),
          Text(
            data?[0]["definition"] ?? " ",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 100),
          PronunciationChecker(
            correctWord: data?[0]["word"] ?? " ",
            lang: "ja-JP",
            pronunciation: data?[0]["word"] ?? " ",
          ),
        ],
      ),
    );
  }

  fetchData() async {
    const url = 'https://random-words-api.vercel.app/word/japanese';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;

    data = jsonDecode(body);
    setState(() {});
  }
}
