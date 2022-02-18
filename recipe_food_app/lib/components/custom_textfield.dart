import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String text;
  final IconData? icon;
  final IconData? iconSuffix;
  final String? labelText;
  const CustomTextField({
    Key? key,
    required this.text,
    required this.controller,
    required this.icon,
    this.keyboardType,
    this.validator,
    this.iconSuffix,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //criar na tela inicial e chamar por contrutor
    return TextFormField(
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      //focusNode: FocusNode(canRequestFocus: true),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        focusedBorder: new OutlineInputBorder(
            borderSide: new BorderSide(color: Color(0xFF918AE2), width: 1), borderRadius: BorderRadius.circular(10)),
        enabledBorder: new OutlineInputBorder(
            borderSide: new BorderSide(color: Color(0xFF918AE2), width: 1), borderRadius: BorderRadius.circular(10)),
        // disabledBorder: new OutlineInputBorder(borderSide: new BorderSide(color: Color(0xFFFAFAFA), width: 1)),
        prefix: Container(
          margin: EdgeInsets.only(left: 15, right: 25),
          child: Icon(
            icon,
            color: Color(0xFF918AE2),
            size: 25,
          ),
        ),
        isDense: true,
        contentPadding: const EdgeInsets.only(bottom: 10, top: 25),
        /* errorText: 'Invalid', */ hintText: text,
        suffix: Container(
          margin: EdgeInsets.only(right: 25),
          child: Icon(
            iconSuffix,
            color: Color(0xFF918AE2),
            size: 25,
          ),
        ),
        /* focusedBorder:  */
      ),
      controller: controller,
      onTap: () {},
    );
  }
}


//incluir validatopr - email
//propriedade do text keyboard typepara ok
// alterar o text input type para 
//escolher o tipo de teclado
//passar o controller por parametro
// focusnode por parametro no construtor (pesquisar)

