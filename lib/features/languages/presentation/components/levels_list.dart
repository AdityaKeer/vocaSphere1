import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:major_project1/features/languages/presentation/pages/hindi/cubits/hindi_cubit.dart';
import '../../../levels/presentation/hindi_levels/hn_lvl4.dart';
import '../../cubits/language_cubit.dart';
import '../../cubits/language_state.dart';
import '../components/level_buttons.dart';

class LevelList extends StatelessWidget {
  const LevelList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        if (state is LevelListUpdated) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.levelPages.length,
            itemBuilder: (context, index) {
              String levelName = state.levelPages.keys.elementAt(index);

              return LevelButton(
                n: index + 1,
                left: index.isEven ? 0 : 140.0,
                right: index.isEven ? 140.0 : 0,
                onTap: () {
                  context.read<LanguageCubit>().selectLevel(levelName, context);
                },
              );
            },
          );
        } else if (state is LevelSelected) {
          return state.lvlPage;
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
