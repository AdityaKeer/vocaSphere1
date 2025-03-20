import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      bloc: BlocProvider.of<HomeCubit>(context),
      builder: (context, state) {
        if (state is LanguageListUpdated) {
          return Column(
            children:
                state.languagePages.entries.map((entry) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: MyButton(
                      text: entry.key,
                      onTap: () async {
                        context.read<LanguageCubit>().language = entry.key;
                        await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => entry.value),
                        );
                      },
                    ),
                  );
                }).toList(),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
