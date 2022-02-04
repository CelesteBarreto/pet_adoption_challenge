import 'package:flutter/material.dart';

class ListileComponent extends StatelessWidget {
  final String nome;
  final String raca;
  final String sexo;
  final String age;
  final String geo;

  const ListileComponent({
    Key? key,
    required this.nome,
    required this.raca,
    required this.sexo,
    required this.age,
    required this.geo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        nome,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(raca),
          Text('$sexo, $age'),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.red,
              ),
              const SizedBox(width: 3),
              Text(geo),
            ],
          )
        ],
      ),
    );
  }
}
