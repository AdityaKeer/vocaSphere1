import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:major_project1/features/languages/presentation/pages/hindi/cubits/hindi_cubit.dart';
import 'package:simple_shadow/simple_shadow.dart';
import '../../../levels/presentation/hindi_levels/hn_lvl4.dart';
import '../../cubits/language_cubit.dart';
import '../../cubits/language_state.dart';
import '../components/level_buttons.dart';

class LevelList extends StatelessWidget {
  // Function(bool)? onLevelLoaded;

  LevelList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Make the container fill the entire available space
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 0.63,
          image: AssetImage('assets/images/lvlListBg3.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          if (state is LevelListUpdated) {
            return ListView.builder(
              itemCount: state.levelPages.length,
              itemBuilder: (context, index) {
                String levelName = state.levelPages.keys.elementAt(index);

                return Center(
                  child: SimpleShadow(
                    opacity: 0.5,
                    offset: const Offset(5, 5),
                    sigma: 7,
                    child: LevelButton(
                      n: index + 1,
                      left: index.isEven ? 0 : 140.0,
                      right: index.isEven ? 140.0 : 0,
                      onTap: () {
                        Widget? wi = context.read<LanguageCubit>().selectLevel(
                          levelName,
                        );
                        if (wi == null) {
                          return;
                        }
                        Navigator.of(
                          context,
                        ).push(MaterialPageRoute(builder: (context) => wi));
                      },
                      levelName: levelName,
                    ),
                  ),
                );
              },
            );
          }

          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                opacity: 0.63,
                image: AssetImage('assets/images/lvlListBg3.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            child: const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
