import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_adoption_challenge/components/custom_card.dart';

import 'components/buttom_filter.dart';
import 'components/custom_app_bar.dart';
import 'components/custom_icon.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String keyObj = "";
  List pets = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/url/pets.json');
    final data = await json.decode(response);
    setState(() {
      pets = data["dogs"];
    });
  }

  @override
  void initState() {
    readJson();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List names = ['Dogs', 'Cats', 'Birds', 'Fishes'];

    //converter lista json para list animais

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomAppBar('Campos, RJ', imagePath: 'assets/images/avatar.png'),
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              height: 600,
              decoration:
                  const BoxDecoration(color: Color(0xFFeef0ed), borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CustomButtomFilter(),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30, right: 10),
                        width: 275,
                        height: 60,
                        child: ListView.builder(
                          physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                          scrollDirection: Axis.horizontal,
                          itemCount: names.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 100,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                  onSurface: Colors.white,
                                  shadowColor: Colors.red,
                                  primary:
                                      index == 0 ? Color(0xFFef4643) : Color(0xfffefefe), /* fixedSize: Size(45, 50) */
                                ),
                                onPressed: () {},
                                icon: CustomIcon(index: index),
                                label: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    names[index],
                                    style: TextStyle(
                                        color: index == 0 ? Color(0xfffefefe) : Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      /*  color: Colors.green, */
                      width: 400,
                      height: 450,
                      child: ListView.builder(
                        physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        itemCount: pets.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 120,
                            height: 150,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CustomCard(
                                  index: index,
                                  url: pets[index]["url"],
                                  nome: pets[index]["name"],
                                  age: pets[index]["age"],
                                  geo: pets[index]["geo"],
                                  raca: pets[index]["breed"],
                                  sexo: pets[index]["sexo"],
                                )),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
