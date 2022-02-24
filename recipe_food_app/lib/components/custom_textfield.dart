import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String text;
  final Widget? icon;
  final IconData? iconSuffix;
  final String? labelText;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final Function()? onPressed;
  const CustomTextField({
    Key? key,
    required this.text,
    required this.controller,
    this.obscureText = false,
    this.icon,
    this.keyboardType,
    this.validator,
    this.iconSuffix,
    this.labelText,
    this.inputFormatters,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //criar na tela inicial e chamar por contrutor
    return TextFormField(
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      //focusNode: FocusNode(canRequestFocus: true),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Color(0xFF918AE2))),
        focusedBorder: new OutlineInputBorder(
            borderSide: new BorderSide(color: Color(0xFF918AE2), width: 1), borderRadius: BorderRadius.circular(10)),
        enabledBorder: new OutlineInputBorder(
            borderSide: new BorderSide(color: Color(0xFF918AE2), width: 1), borderRadius: BorderRadius.circular(10)),
        // disabledBorder: new OutlineInputBorder(borderSide: new BorderSide(color: Color(0xFFFAFAFA), width: 1)),
        prefixIcon: Container(
          margin: EdgeInsets.only(left: 15, right: 25),
          child: icon,
        ),
        isDense: true,
        contentPadding: const EdgeInsets.only(bottom: 5, top: 15),
        /* errorText: 'Invalid', */ hintText: text,

        suffixIcon: Container(
          margin: EdgeInsets.only(right: 25),
          child: GestureDetector(
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                iconSuffix,
                color: Color(0xFF918AE2),
                size: 25,
              ),
            ),
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

