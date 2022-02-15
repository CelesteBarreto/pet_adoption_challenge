import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function()? onPressed;
  const CustomElevatedButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(primary: Color(0xff425AC2), shape: CircleBorder()),
          child: Icon(
            Icons.arrow_right_alt_sharp,
            size: 30,
          )),
    );
  }
}
