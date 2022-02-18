import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final TextDecoration? decoration;
  final String text;
  final double fontSize;
  final Function()? onPressed;

  const CustomTextButton({
    Key? key,
    required this.text,
    required this.fontSize,
    this.decoration,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          decoration: decoration,
          fontWeight: FontWeight.bold,
          color: Color(0xFF465EC2),
          fontSize: fontSize,
        ),
      ),
    );
  }
}
