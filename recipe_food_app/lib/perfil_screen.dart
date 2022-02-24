import 'package:flutter/material.dart';

import 'components/camera_custom.dart';
import 'components/custom_elevated_button.dart';
import 'components/custom_text.dart';
import 'components/custom_textfield.dart';
import 'home_page.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'models/flag_model.dart';

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

  List<FlagCountryModel> listadeModel = [
    FlagCountryModel(
        flagImage:
            'https://w7.pngwing.com/pngs/397/707/png-transparent-flag-of-brazil-illustration-flag-of-brazil-flags-of-the-world-flag-of-australia-brazilian-flag-template-miscellaneous-flag-sphere.png',
        nameCountry: 'Brasil'),
    FlagCountryModel(
        flagImage:
            'https://w7.pngwing.com/pngs/938/278/png-transparent-flag-of-the-united-states-flags-of-the-world-united-states-flag-united-states-flag-of-the-united-states.png',
        nameCountry: 'EUA'),
    FlagCountryModel(
        flagImage:
            'https://img2.gratispng.com/20180319/dxe/kisspng-flag-font-spain-5ab06220000828.0392048815215088960001.jpg',
        nameCountry: 'Espanha'),
    FlagCountryModel(
        flagImage:
            'https://img2.gratispng.com/20171202/d91/china-flag-png-file-5a228f61925c94.5359207415122143695995.jpg',
        nameCountry: 'China'),
    FlagCountryModel(
        flagImage:
            'https://img2.gratispng.com/20180820/kgy/kisspng-flag-of-south-korea-flag-of-north-korea-the-new-home-of-betting-bet-me-5b7b4417139fe3.2003672215348050150804.jpg',
        nameCountry: 'Coréia do Sul'),
    FlagCountryModel(
        flagImage:
            'https://img2.gratispng.com/20181120/zjv/kisspng-flag-of-south-africa-vector-graphics-stock-illustr-south-africa-vs-india-odds-5bf4703f1e9b99.8971805515427461751254.jpg',
        nameCountry: 'África'),
    FlagCountryModel(
        flagImage:
            'https://img1.gratispng.com/20180401/yye/kisspng-flag-of-portugal-national-flag-flag-of-poland-portugal-5ac0b5f3e18818.0715604115225789319238.jpg',
        nameCountry: 'Portugal'),
  ];

  @override
  void initState() {
    super.initState();
    _flagChoose = listadeModel[0];
  }

  @override
  void dispose() {
    controllerName.dispose();
    super.dispose();
  }

  void _onDropDownItemSelected(FlagCountryModel? newSelectedBFlag) {
    setState(() {
      _flagChoose = newSelectedBFlag!;
    });
  }

  @override
  Widget build(BuildContext context) {
    var telefone = MaskTextInputFormatter(
        mask: '(##) #####-####', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.lazy);
    var cpf = MaskTextInputFormatter(
        mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.lazy);
    var rg = MaskTextInputFormatter(
        mask: '##.###.###-#', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.lazy);
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
                          FormField(
                            builder: (FormFieldState<String> state) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(12, 10, 20, 20),
                                    errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<FlagCountryModel>(
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 30,
                                      ),
                                      isDense: true,
                                      isExpanded: true,
                                      onChanged: (FlagCountryModel? newSelectedFlag) {
                                        _onDropDownItemSelected(newSelectedFlag);
                                      },
                                      value: _flagChoose,
                                      items: listadeModel
                                          .map<DropdownMenuItem<FlagCountryModel>>((FlagCountryModel value) {
                                        return DropdownMenuItem(
                                            value: value,
                                            child: Row(
                                              children: [
                                                new CircleAvatar(backgroundImage: new NetworkImage(value.flagImage)),
                                                SizedBox(width: 15),
                                                Text(value.nameCountry)
                                              ],
                                            ));
                                      }).toList()),
                                ),
                              );
                            },
                          ),
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
                            inputFormatters: [cpf],
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
                            inputFormatters: [rg],
                          ),
                          SizedBox(height: 15),
                          CustomText(text: 'Telefone', fontSize: 16),
                          SizedBox(height: 15),
                          CustomTextField(
                            inputFormatters: [telefone],
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
                          SizedBox(
                            height: 60,
                          )
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
