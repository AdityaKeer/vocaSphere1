import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:major_project1/features/authentication/presentation/cubits/auth_cubit.dart';
import 'package:major_project1/features/home/presentation/cubits/home_cubit.dart';
import 'package:major_project1/features/languages/cubits/language_cubit.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../components/language_buttons.dart';
import '../cubits/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List languageList = List.empty(growable: true);
  HomeCubit? cubit;

  String userName = '';
  double percentage = 0;

  @override
  void initState() {
    cubit = BlocProvider.of<HomeCubit>(context);
    cubit?.initializeLanguages();
    cubit?.getUserName();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is UserNameFetched) {
          setState(() {
            userName = state.userName;
          });
        }
      },
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 160,
                color: Colors.red,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: GestureDetector(
                        onTap: () async {
                          ImagePicker imagePicker = ImagePicker();
                          XFile? file = await imagePicker.pickImage(
                            source: ImageSource.camera,
                          );
                          print('${file?.path}');
                        },
                        child: Image(
                          image: AssetImage(
                            'assets/images/progLevelsListIcon.png',
                          ),
                          height: 90,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          userName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              ListTile(
                title: const Text(
                  'Log Out',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  context.read<AuthCubit>().logOut();
                },
              ),
              ListTile(
                title: const Text(
                  'trial',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  context.read<LanguageCubit>().completionPercentage('Marathi');
                },
              ),
              Column(
                children: [
                  Text('Hindi'),
                  LinearPercentIndicator(
                    progressColor: Colors.green,
                    percent: 0.5,
                    lineHeight: 20,
                    width: 300,
                  ),
                ],
              ),
            ],
          ),
        ),
        appBar: AppBar(centerTitle: true, title: const Text('Home')),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.menu_book_rounded,
                      size: 80,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                    SizedBox(height: 20),
                    const Text(
                      'Choose the language you would like to learn..',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
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
