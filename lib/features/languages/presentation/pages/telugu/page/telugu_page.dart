import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../authentication/presentation/cubits/auth_cubit.dart';
import '../../../components/levels_list.dart';

class TeluguPage extends StatefulWidget {
  const TeluguPage({super.key});

  @override
  State<TeluguPage> createState() => _TeluguPageState();
}

class _TeluguPageState extends State<TeluguPage> {
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
