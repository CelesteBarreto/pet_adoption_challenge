import 'package:flutter/material.dart';

import 'custom_textbutton.dart';

class CustomRadioButton extends StatelessWidget {
  final bool check;
  const CustomRadioButton({
    required this.check,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool confirm = false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Radio(
          visualDensity:
              VisualDensity(horizontal: VisualDensity.minimumDensity, vertical: VisualDensity.minimumDensity),
          //ver propriedade para tirar o padding interno
          value: 0,
          groupValue: confirm,
          onChanged: (value) {},
          activeColor: Colors.green,
        ),
        Expanded(
          child: SizedBox(
            width: 330,
            child: check == true
                ? Text('Remember me')
                : RichText(
                    text: const TextSpan(
                        text: 'I agree to the',
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                        TextSpan(
                            text: ' Terms of Service',
                            style: TextStyle(
                              color: Color(0xFF465EC2),
                            ),
                            children: <TextSpan>[
                              TextSpan(text: ' and ', style: TextStyle(color: Colors.black), children: <TextSpan>[
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: TextStyle(
                                    color: Color(0xFF465EC2),
                                  ),
                                )
                              ])
                            ])
                      ])),
          ),
        ),
        check == true
            ? CustomTextButton(
                text: 'Forgot password?',
                fontSize: 12,
                decoration: TextDecoration.underline,
              )
            : Container()
      ],
    );
  }
}
