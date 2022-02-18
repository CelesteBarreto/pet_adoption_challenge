import 'package:flutter/material.dart';

import 'components/custom_elevated_button.dart';
import 'components/custom_text.dart';
import 'components/custom_textfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      backgroundColor: Color(0xFFFAFAFA),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              left: 30,
              top: 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    padding: EdgeInsets.all(0.0),
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back_rounded),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/waving-hand-icon.png",
                        width: 16,
                        height: 16,
                      ),
                      SizedBox(width: 5),
                      CustomText(text: 'Hello', fontSize: 20),
                    ],
                  ),
                  CustomText(text: 'Are you new here?', fontSize: 20),
                  SizedBox(height: 20),
                  RichText(
                      text: const TextSpan(
                          text: 'If you have an account/',
                          style: TextStyle(color: Color(0xffB9B9B9)),
                          children: <TextSpan>[
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF465E6D),
                          ),
                        )
                      ])),
                ],
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
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30),
                          CustomText(text: 'Full Name', fontSize: 16),
                          SizedBox(height: 15),
                          CustomTextField(
                            icon: Icons.person_outline,
                            controller: controllerName,
                            text: 'Name',
                            keyboardType: TextInputType.name,
                          ),
                          SizedBox(height: 30),
                          CustomText(text: 'E-mail', fontSize: 16),
                          SizedBox(height: 15),
                          CustomTextField(
                            icon: Icons.email_outlined,
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
                          SizedBox(height: 30),
                          CustomText(text: 'Password', fontSize: 16),
                          SizedBox(height: 15),
                          CustomTextField(
                            icon: Icons.lock_outline_rounded,
                            iconSuffix: Icons.remove_red_eye_outlined,
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
                          CustomElevatedButton(
                            onPressed: () {
                              /* if (_formKey.currentState!.validate()) {
                                person['nome'] = controllerName.text;
                                person['email'] = controllerEmail.text;
                                return Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (BuildContext context) => ()));
                              } */
                            },
                          ),
                        ],
                      ),
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
}
