import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../authentication/presentation/cubits/auth_cubit.dart';
import '../../../../cubits/language_cubit.dart';
import '../../../components/levels_list.dart';

class SanskritPage extends StatefulWidget {
  const SanskritPage({super.key});

  @override
  State<SanskritPage> createState() => _SanskritPageState();
}

class _SanskritPageState extends State<SanskritPage> {
  @override
  void initState() {
    context.read<LanguageCubit>().initializeLevels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
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
