import 'package:flutter/material.dart';

class LevelButton extends StatelessWidget {
  final int n;
  final double right;
  final double left;
  final VoidCallback onTap;

  const LevelButton({
    super.key,
    required this.n,
    required this.onTap,
    required this.right,
    required this.left,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: right, left: left),
        child: Image.asset('assets/images/level$n.png', height: 150),
      ),
    );
  }
}
