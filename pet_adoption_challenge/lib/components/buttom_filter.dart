import 'package:flutter/material.dart';

class CustomButtomFilter extends StatelessWidget {
  const CustomButtomFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      /* color: Colors.pink, */
      margin: const EdgeInsets.only(top: 30, left: 30),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              side: const BorderSide(width: 5.0, color: Colors.white),
              primary: const Color(0xfffefefe),
              fixedSize: const Size(45, 60)),
          onPressed: () {},
          child: const Icon(Icons.filter_list, size: 30, color: Color(0xffaeaeae))),
    );
  }
}
