import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:major_project1/features/authentication/presentation/cubits/auth_cubit.dart';
import 'package:major_project1/features/home/presentation/cubits/home_cubit.dart';
import 'package:major_project1/features/languages/cubits/language_cubit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../components/language_buttons.dart';
import '../cubits/home_state.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? image;

  Future pickImage() async {
    try {
      final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (picked == null) return;

      final prefs = await SharedPreferences.getInstance();

      // Delete old image if it exists
      final oldPath = prefs.getString('user_image');
      if (oldPath != null) {
        final oldImage = File(oldPath);
        if (await oldImage.exists()) {
          await oldImage.delete();
        }
      }

      // Save new image permanently
      final savedImage = await saveImagePermanently(picked.path);

      // Update SharedPreferences
      await prefs.setString('user_image', savedImage.path);

      setState(() {
        image = savedImage;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = imagePath.split('/').last; // Extracts the file name
    final newImage = File('${directory.path}/$name');

    return File(imagePath).copy(newImage.path);
  }

  List languageList = List.empty(growable: true);
  HomeCubit? cubit;

  String userName = '';
  double percentage = 0;
  double percentage2 = 0;
  List<LangProgress> percentageOfLangList = List.empty(growable: true);

  @override
  void initState() {
    cubit = BlocProvider.of<HomeCubit>(context);
    cubit?.initializeLanguages();
    cubit?.getUserName(['Marathi', 'Japanese', 'Hindi', 'Sanskrit', 'English']);
    _loadImage();
    super.initState();
  }

  void _loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('user_image');
    if (imagePath != null) {
      setState(() {
        image = File(imagePath);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is UserNameFetched) {
          setState(() {
            userName = state.userName;
            percentageOfLangList = state.listOfLaves;
            setState(() {});
          });
        }
      },
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.red, Colors.redAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: pickImage,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child:
                              image != null
                                  ? Image.file(
                                    image!,
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.cover,
                                  )
                                  : Container(
                                    width: 80,
                                    height: 80,
                                    color: Colors.white,
                                    child: Center(child: FlutterLogo(size: 40)),
                                  ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          userName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 24,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 12),

              ...percentageOfLangList.map((lv) {
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lv.langName,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10),
                        LinearPercentIndicator(
                          animation: true,
                          progressColor: Colors.green,
                          backgroundColor: Colors.grey.shade300,
                          percent: lv.completed,
                          lineHeight: 8,
                          barRadius: Radius.circular(8),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GestureDetector(
                  onTap: () {
                    context.read<AuthCubit>().logOut();
                  },
                  child: Card(
                    color: Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 20,
                      ),
                      child: Row(
                        children: [
                          Icon(Iconsax.logout_bold, color: Colors.black87),
                          SizedBox(width: 12),
                          Text(
                            'Log Out',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        appBar: AppBar(centerTitle: true, title: const Text('Home')),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Bootstrap.book,
                      size: 100,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Choose the language you would like to learn',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    SizedBox(height: 40),
                    LanguageButtonsList(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
