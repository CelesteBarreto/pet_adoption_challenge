import 'package:flutter/material.dart';
import 'package:sign_in_sign_up_form/sign_up_page.dart';

import 'components/custom_elevated_button.dart';
import 'components/custom_radio_button.dart';
import 'components/custom_text.dart';
import 'components/custom_textbutton.dart';
import 'components/custom_textfield.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  Map person = {'nome': 'nome', 'email': 'email', 'senha': 'senha'};

  @override
  void dispose() {
    controllerName.dispose();
    super.dispose();
  }

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
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 60),
                          CustomText(text: 'Get Started', fontSize: 35),
                          SizedBox(height: 15),
                          CustomTextField(
                            controller: controllerName,
                            text: 'Name',
                            keyboardType: TextInputType.name,
                          ),
                          CustomTextField(
                            controller: controllerEmail,
                            text: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
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
                          SizedBox(height: 10),
                          CustomRadioButton(
                            check: false,
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextButton(
                                text: 'Sign Up',
                                fontSize: 21,
                                onPressed: () => Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (BuildContext context) => SignUpPage())),
                              ),
                              CustomElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    person['nome'] = controllerName.text;
                                    person['email'] = controllerEmail.text;
                                    return Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (BuildContext context) => SignUpPage()));
                                  }
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 3),
                          CustomTextButton(
                            text: 'Sign In',
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

/* import 'package:flutter/material.dart';
import 'package:sign_in_sign_up_form/sign_up_page.dart';

import 'components/custom_elevated_button.dart';
import 'components/custom_radio_button.dart';
import 'components/custom_text.dart';
import 'components/custom_textbutton.dart';
import 'components/custom_textfield.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
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
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 60),
                        CustomText(text: 'Get Started', fontSize: 40),
                        SizedBox(height: 30),
                        CustomTextField(
                          controller: controller,
                          text: 'Name',
                          keyboardType: TextInputType.name,
                        ),
                        CustomTextField(
                          controller: controller,
                          text: 'Email',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        CustomTextField(
                          controller: controller,
                          text: 'Password',
                          validator: (value) {
                            if (value!.length < 3) {
                              return 'Preencha com mais caracteres';
                            }
                            return 'null';
                          },
                        ),
                        CustomRadioButton(
                          check: false,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextButton(
                              text: 'Sign Up',
                              fontSize: 30,
                            ),
                            CustomElevatedButton(
                              onPressed: () {
                                return Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (BuildContext context) => SignUpPage()));
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 3),
                        CustomTextButton(
                          text: 'Sign In',
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
    );
  }
} */
