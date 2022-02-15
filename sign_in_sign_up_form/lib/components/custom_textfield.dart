import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String text;
  const CustomTextField({
    Key? key,
    required this.text,
    required this.controller,
    this.keyboardType,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //criar na tela inicial e chamar por contrutor
    return TextFormField(
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      focusNode: FocusNode(canRequestFocus: true),
      keyboardType: keyboardType,
      decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.only(bottom: 10, top: 25),
          /* errorText: 'Invalid', */ hintText: text),
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

