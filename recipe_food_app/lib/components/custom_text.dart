import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final TextDecoration? decoration;
  final String text;
  final double fontSize;

  const CustomText({
    Key? key,
    required this.text,
    required this.fontSize,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          decoration: decoration,
          fontWeight: FontWeight.bold,
          color: Color(0xFF5C5C5C),
          fontSize: fontSize,
        ));
  }
}
