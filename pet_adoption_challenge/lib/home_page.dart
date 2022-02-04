import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/buttom_filter.dart';
import 'components/custom_app_bar.dart';
import 'components/custom_icon.dart';
import 'components/listile_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List pets = ['Dogs', 'Cats', 'Birds', 'Fishes'];

    Map<String, dynamic> myPetsMap = {
      "dogs": [
        {
          "url": "assets/images/dog1.png",
          "name": "Sparky",
          "breed": "Golden Retriever",
          "sexo": "Female",
          "age": "8 months old",
          "geo": "2.5"
        },
        {
          "url": "assets/images/dog2.png",
          "name": "Charlie",
          "breed": "Boston Terrier",
          "sexo": "Male",
          "age": "1.5 years old",
          "geo": "2.8 Kms away"
        },
        {
          "url": "assets/images/dog3.png",
          "name": "Sparky",
          "breed": "Golden Retriever",
          "sexo": "Sparky",
          "age": "Sparky",
          "geo": "2.5"
        },
        {
          "url": "assets/images/dog4.png",
          "name": "Sparky",
          "breed": "Golden Retriever",
          "sexo": "Sparky",
          "age": "Sparky",
          "geo": "2.5"
        }
      ]
    };

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
                          itemCount: pets.length,
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
                                    pets[index],
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
                            child: Card(
                              margin: const EdgeInsets.all(10),
                              color: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    width: 110,
                                    height: 110,
                                    child: Image.asset(
                                      'assets/images/dog1.png',
                                      fit: BoxFit.cover,
                                    ),
                                    decoration:
                                        BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(5)),
                                  ),
                                  const SizedBox(
                                    height: 110,
                                    width: 150,
                                    child: ListileComponent(
                                      nome: 'Nome',
                                      raca: 'Raça',
                                      sexo: 'sexo',
                                      age: 'age',
                                      geo: '2km',
                                    ),
                                  ),
                                  SizedBox(
                                      height: 110,
                                      width: 80,
                                      child: Stack(children: [
                                        Positioned(
                                          right: 7,
                                          top: 7,
                                          child: Icon(
                                            index == 0 ? Icons.favorite : Icons.favorite_border,
                                            color: index == 0 ? Colors.red : Colors.black,
                                          ),
                                        )
                                      ]))
                                ],
                              ),
                            ),
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
