import 'package:flutter/material.dart';
import 'package:recipe_food_app/components/custom_text.dart';
import 'package:recipe_food_app/components/select_formfield.dart';

import '../components/camera_custom.dart';
import '../components/custom_elevated_button.dart';
import '../components/custom_textfield.dart';

import '../models/countries.dart';
import '../models/flag_model.dart';
import '../models/mask_class.dart';
import 'home_page.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();

  TextEditingController controllerCpf = TextEditingController();
  TextEditingController controllerRg = TextEditingController();
  TextEditingController controllerTelefone = TextEditingController();

  FlagCountryModel _flagChoose = FlagCountryModel(flagImage: '', nameCountry: '');

  Countries countries = Countries();

  MaskCLass mascaras = MaskCLass();

  @override
  void initState() {
    super.initState();
  }

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
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(0.0),
                    onPressed: () =>
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => HomePage())),
                    icon: Icon(Icons.arrow_back_rounded),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/sunglasses_smile.png",
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 5),
                      CustomText(text: 'Setting up to your', fontSize: 20),
                    ],
                  ),
                  CustomText(text: 'profile', fontSize: 20),
                  SizedBox(height: 20),
                  RichText(
                      text: const TextSpan(
                    text: 'Add your profile photo',
                    style: TextStyle(color: Color(0xffB9B9B9)),
                  )),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).viewInsets.bottom > 0.0 ? 0.0 : 220,
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
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30),
                          Center(child: CameraCustom()),
                          SizedBox(height: 30),
                          CustomText(text: 'Display Name', fontSize: 16),
                          SizedBox(height: 15),
                          CustomTextField(
                            icon: Icon(
                              Icons.person,
                              color: Color(0xFF918AE2),
                              size: 25,
                            ),
                            controller: controllerName,
                            text: 'Name',
                            keyboardType: TextInputType.name,
                          ),
                          SizedBox(height: 15),
                          CustomText(text: 'Country', fontSize: 16),
                          SizedBox(height: 15),
                          SelectFormFieldCustom(),
                          SizedBox(height: 15),
                          CustomText(text: 'CPF', fontSize: 16),
                          SizedBox(height: 15),
                          CustomTextField(
                            controller: controllerCpf,
                            text: 'CPF',
                            validator: (value) {
                              if (value!.length < 3) {
                                return 'Preencha com mais caracteres';
                              }
                              return null;
                            },
                            icon: Container(
                              child: Image.asset(
                                "assets/images/cpf.jpg",
                                width: 16,
                                height: 16,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [mascaras.cpf],
                          ),
                          SizedBox(height: 15),
                          CustomText(text: 'RG', fontSize: 16),
                          SizedBox(height: 15),
                          CustomTextField(
                            controller: controllerRg,
                            text: 'RG',
                            validator: (value) {
                              if (value!.length < 3) {
                                return 'Preencha com mais caracteres';
                              }
                              return null;
                            },
                            icon: Container(
                              child: Image.asset(
                                "assets/images/rg.png",
                                width: 16,
                                height: 16,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [mascaras.rg],
                          ),
                          SizedBox(height: 15),
                          CustomText(text: 'Telefone', fontSize: 16),
                          SizedBox(height: 15),
                          CustomTextField(
                            inputFormatters: [mascaras.telefone],
                            keyboardType: TextInputType.phone,
                            icon: Icon(
                              Icons.phone_android,
                              color: Color(0xFF918AE2),
                              size: 20,
                            ),
                            controller: controllerTelefone,
                            text: 'Telefone',
                            validator: (value) {
                              if (!RegExp(r'\(\d{2}\)\s\d{4,5}\-\d{4}').hasMatch(value!)) {
                                return 'Preencha com telefone válido';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 70),
                          CustomElevatedButton(
                            text: 'Confirm',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                return Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (BuildContext context) => HomePage()));
                              }
                            },
                          ),
                          SizedBox(height: 60)
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
