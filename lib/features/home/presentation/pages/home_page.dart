import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:major_project1/features/authentication/presentation/cubits/auth_cubit.dart';
import 'package:major_project1/features/home/presentation/cubits/home_cubit.dart';
import '../../../authentication/presentation/components/common_button.dart';
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

  @override
  void initState() {
    cubit = BlocProvider.of<HomeCubit>(context);
    // cubit?.add(FetchData());
    cubit?.initializeLanguages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthCubit>().logOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.menu_book_rounded,
                    size: 80,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  const Text(
                    'Choose the language you would like to learn..',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 80),
                  LanguageButtonsList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
