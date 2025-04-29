import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../authentication/presentation/cubits/auth_cubit.dart';
import '../../components/levels_list.dart';

class KannadaPage extends StatefulWidget {
  const KannadaPage({super.key});

  @override
  State<KannadaPage> createState() => _KannadaPageState();
}

class _KannadaPageState extends State<KannadaPage> {
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
