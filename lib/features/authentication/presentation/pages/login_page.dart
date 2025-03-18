import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:major_project1/features/authentication/presentation/cubits/auth_cubit.dart';
import 'package:major_project1/features/authentication/presentation/components/common_text_field.dart';
import 'package:major_project1/features/authentication/presentation/components/common_button.dart';

class LoginPage extends StatefulWidget {
  final void Function()? togglePages;
  const LoginPage({super.key, required this.togglePages});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  void login() {
    final String email = emailController.text;
    final String pass = passController.text;

    final authCubit = context.read<AuthCubit>();

    //check fields not empty

    if (email.isNotEmpty && pass.isNotEmpty) {
      authCubit.login(email, pass);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('please enter both email and password!!')),
      );
    }
  }

  @override
  void dispose() {
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
                SizedBox(height: 50),
                Text(
                  'Welcome Back,You\'ve been missed alot !!',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(height: 30),
                MyTextField(
                  controller: emailController,
                  hintText: 'Enter an email',
                  obscureText: false,
                ),
                SizedBox(height: 15),
                MyTextField(
                  controller: passController,
                  hintText: 'Enter a password',
                  obscureText: true,
                ),
                SizedBox(height: 15),
                MyButton(text: 'Login', onTap: login),
                SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a user? ,',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.togglePages,
                      child: Text(
                        ' Register Now',
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
