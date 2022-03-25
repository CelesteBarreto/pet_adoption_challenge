import 'package:flutter/material.dart';

import 'package:time_weather/model/city.dart';
import 'package:time_weather/model/city_model.dart';
import 'package:time_weather/model/weather_entity.dart';

class SelectFormFieldCustom extends StatefulWidget {
  final Function(CityModel?)? onChanged;
  const SelectFormFieldCustom({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<SelectFormFieldCustom> createState() => _SelectFormFieldCustomState();
}

class _SelectFormFieldCustomState extends State<SelectFormFieldCustom> {
  City city = City();
  CityModel cityModel = CityModel('');
  WeatherEntity weatherEntity = WeatherEntity();

  @override
  void initState() {
    super.initState();
    cityModel = city.listadeModel[0];
  }

  void _onDropDownItemSelected(CityModel? newSelectedBFlag) {
    setState(() {
      cityModel = newSelectedBFlag!;
      widget.onChanged!(newSelectedBFlag);
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
              border: OutlineInputBorder(borderSide: BorderSide.none)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<CityModel>(
                dropdownColor: Color(0xFF71F2EB),
                icon: Icon(
                  Icons.keyboard_arrow_down_sharp,
                  size: 20,
                ),
                isDense: true,
                isExpanded: true,
                onChanged: (CityModel? newSelectedFlag) {
                  _onDropDownItemSelected(newSelectedFlag);
                },
                value: cityModel,
                items: city.listadeModel.map<DropdownMenuItem<CityModel>>((CityModel value) {
                  return DropdownMenuItem(
                      /* onTap: () => , */
                      value: value,
                      child: Container(
                        child: Text(
                          value.nome,
                          style: TextStyle(fontSize: 17),
                        ),
                      ));
                }).toList()),
          ),
        );
      },
    );
  }
}
