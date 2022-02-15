import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final Function? onPressed;
  const CustomTextButton({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(text,
          style: TextStyle(
            color: Color(0xFF465EC2),
            fontSize: fontSize,
          )),
    );
  }
}
