

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:major_project1/features/home/presentation/cubits/home_cubit.dart';
import 'package:major_project1/features/home/presentation/cubits/home_state.dart';
import 'package:major_project1/features/authentication/presentation/components/common_button.dart';
import 'package:major_project1/features/languages/cubits/language_cubit.dart';

class LanguageButtonsList extends StatefulWidget {
  const LanguageButtonsList({super.key});

  @override
  State<LanguageButtonsList> createState() => _LanguageButtonsListState();
}

class _LanguageButtonsListState extends State<LanguageButtonsList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is LanguageListUpdated) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:
                  state.languagePages.entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 17),
                      child: MyButton(
                        text: entry.key,
                        onTap: () async {
                          final languageCubit = context.read<LanguageCubit>();
                          final homeCubit = context.read<HomeCubit>();

                          await languageCubit.setLanguageAndLoadProgress(
                            entry.key,
                          );
                          languageCubit.resetLevel();

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => entry.value,
                            ),
                          ).then((_) {
                            homeCubit.resetLanguages();
                          });
                        },
                      ),
                    );
                  }).toList(),
            ),
          );
        }

        return Center(
          child: Hero(
            tag: 'superman',
            child: Lottie.asset(
              'assets/jsonAnimations/loadingScene.json',
              height: 200,
              width: 200,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }
}
