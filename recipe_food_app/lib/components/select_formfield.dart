/* import 'package:flutter/material.dart';

import 'package:recipe_food_app/models/flag_model.dart';

class SelectFormFieldCustom extends StatefulWidget {
  final FlagCountryModel flagChoose;
  const SelectFormFieldCustom({
    Key? key, this.flagChoose,
   
  }) : super(key: key);

  @override
  State<SelectFormFieldCustom> createState() => _SelectFormFieldCustomState();
}

class _SelectFormFieldCustomState extends State<SelectFormFieldCustom> {
  FlagCountryModel _flagChoose = FlagCountryModel(flagImage: '', nameCountry: '');
  void _onDropDownItemSelected(FlagCountryModel? newSelectedBFlag) {
    setState(() {
      _flagChoose = newSelectedBFlag!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (FormFieldState<String> state) {
        return InputDecorator(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(12, 10, 20, 20),
              errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<FlagCountryModel>(
                isDense: true,
                isExpanded: true,
                onChanged: (FlagCountryModel? newSelectedFlag) {
                  _onDropDownItemSelected(newSelectedFlag);
                },
                value: _flagChoose,
                items: listadeModel.map<DropdownMenuItem<FlagCountryModel>>((FlagCountryModel value) {
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
    );
  }
}
 */