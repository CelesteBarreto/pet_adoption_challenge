import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final int index;
  const CustomIcon({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> icon = [
      'assets/images/cao.png',
      'assets/images/gato.png',
      'assets/images/papagaio.png',
      'assets/images/switch.png',
    ];

    return Image.asset(
      icon[index],
      color: index == 0 ? Color(0xfffefefe) : Color(0xffaeaeae),
      width: 18,
      height: 18,
    );
  }
}
