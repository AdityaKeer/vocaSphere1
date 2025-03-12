import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:major_project1/features/authentication/presentation/cubits/auth_cubit.dart';

import '../components/common_button.dart';
import '../components/common_text_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? togglePages;
  const RegisterPage({super.key, required this.togglePages});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  void register() {
    final String name = nameController.text;
    final String email = emailController.text;
    final String pass = passController.text;
    final String confirmPass = confirmPassController.text;

    final authCubit = context.read<AuthCubit>();

    if (email.isNotEmpty &&
        name.isNotEmpty &&
        pass.isNotEmpty &&
        confirmPass.isNotEmpty) {
      if (pass == confirmPass) {
        authCubit.register(name, email, pass);
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("please fill all the fields")));
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock_open_sharp,
                  size: 80,
                  color: Colors.grey.shade600,
                ),
                SizedBox(height: 40),
                Text(
                  'let\'s create an account for you',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 30),

                MyTextField(
                  controller: nameController,
                  hintText: 'Enter Your Name',
                  obscureText: false,
                ),
                SizedBox(height: 15),
                MyTextField(
                  controller: emailController,
                  hintText: 'Enter your email',
                  obscureText: false,
                ),
                SizedBox(height: 15),
                MyTextField(
                  controller: passController,
                  hintText: 'Enter a strong password',
                  obscureText: true,
                ),
                SizedBox(height: 15),
                MyTextField(
                  controller: confirmPassController,
                  hintText: 'Confirm the password',
                  obscureText: true,
                ),
                SizedBox(height: 15),
                MyButton(text: 'Register', onTap: register),
                SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a user? , ',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.togglePages,
                      child: Text(
                        ' Login Now',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
