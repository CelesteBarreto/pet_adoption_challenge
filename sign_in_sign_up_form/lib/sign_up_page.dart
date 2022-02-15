import 'package:flutter/material.dart';
import 'package:sign_in_sign_up_form/sign_in_page.dart';

import 'components/custom_elevated_button.dart';
import 'components/custom_radio_button.dart';
import 'components/custom_text.dart';
import 'components/custom_textbutton.dart';
import 'components/custom_textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              // ignore: prefer_const_constructors
              Container(
                height: 260,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                ),
                child: Image.asset(
                  "assets/images/bg_image.png",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 230,
                left: 0,
                right: 0,
                child: Container(
                  height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(60), color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 60),
                          CustomText(text: 'Welcome back', fontSize: 40),
                          SizedBox(height: 30),
                          CustomTextField(
                            controller: controllerEmail,
                            text: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            validator: (String? value) {
                              if (!RegExp(r'[a-zA-Z0-9.-_]+@[a-zA-Z0-9-_]+\..+').hasMatch(value!)) {
                                return 'Preencha com email válido';
                              }
                              return null;
                            },
                          ),
                          CustomTextField(
                            controller: controllerPassword,
                            text: 'Password',
                            validator: (value) {
                              if (value!.length < 3) {
                                return 'Preencha com mais caracteres';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 3),
                          CustomRadioButton(
                            check: true,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextButton(
                                  text: 'Sign In',
                                  fontSize: 26,
                                  onPressed: () => Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (BuildContext context) => SignInPage()))),
                              CustomElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Future.delayed(Duration(seconds: 1));
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (BuildContext context) => SignInPage()));
                                  } else {
                                    return null;
                                  }
                                  ;
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          CustomText(
                            text: 'Sign Up',
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
