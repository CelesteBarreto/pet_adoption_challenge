import 'package:flutter/material.dart';

import 'listile_component.dart';

class CustomCard extends StatelessWidget {
  final int index;
  final String url;
  final String nome;
  final String raca;
  final String sexo;
  final String age;
  final String geo;
  const CustomCard(
      {Key? key,
      required this.index,
      required this.url,
      required this.nome,
      required this.raca,
      required this.sexo,
      required this.age,
      required this.geo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool favorite = false;
    return Card(
      margin: const EdgeInsets.all(10),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            width: 110,
            height: 110,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                url,
                fit: BoxFit.cover,
              ),
            ),
            decoration: BoxDecoration(/* color: Colors.pink, */ borderRadius: BorderRadius.circular(10)),
          ),
          SizedBox(
            height: 110,
            width: 150,
            child: ListileComponent(
              nome: nome,
              raca: raca,
              sexo: sexo,
              age: age,
              geo: geo,
            ),
          ),
          SizedBox(
              height: 110,
              width: 80,
              child: Stack(children: [
                Positioned(
                  right: 7,
                  top: 7,
                  child: GestureDetector(
                    onTap: () => !favorite,
                    child: Icon(
                      favorite == true && index != null ? Icons.favorite : Icons.favorite_border,
                      color: favorite == true && index != null ? Colors.red : Colors.black,
                    ),
                  ),
                )
              ]))
        ],
      ),
    );
  }
}
