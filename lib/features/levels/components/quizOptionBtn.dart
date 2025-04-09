import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OptionButton extends StatefulWidget {
  final String text;
  final Function() onTap;
  Color? bgColor;

  OptionButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.bgColor,
  });

  @override
  State<OptionButton> createState() => _OptionButtonState();
}

class _OptionButtonState extends State<OptionButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.bgColor,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          widget.text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
