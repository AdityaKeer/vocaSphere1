import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../authentication/presentation/cubits/auth_cubit.dart';
import '../../../../cubits/language_cubit.dart';
import '../../../components/level_buttons.dart';
import '../../../components/levels_list.dart';
import '../cubits/hindi_cubit.dart';

class HindiPage extends StatefulWidget {
  const HindiPage({super.key});

  @override
  State<HindiPage> createState() => _HindiPageState();
}

class _HindiPageState extends State<HindiPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Levels'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthCubit>().logOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(child: LevelList()),
    );
  }
}
