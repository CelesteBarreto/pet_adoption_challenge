import 'package:flutter/material.dart';
import 'package:time_weather/assets.dart';
import 'package:time_weather/components/custom_text.dart';
import 'package:time_weather/controllers.dart/weather_controller.dart';
import 'package:time_weather/model/weather_entity.dart';

import '../components/select_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherController controller = WeatherController();
  Future<WeatherEntity> value = WeatherController().showWheather();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF71F2EB),
      body: FutureBuilder(
          future: value,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('erro de dados'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            final item = snapshot.data as WeatherEntity;
            final urlImage;
            if (item.description == 'Clear') {
              urlImage = MyAssetsClass.clear;
            } else if (item.description == 'Windy') {
              urlImage = MyAssetsClass.windy;
            } else if (item.description == 'Partly cloudy') {
              urlImage = MyAssetsClass.cloud;
            } else {
              urlImage = MyAssetsClass.rain;
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50, left: 25),
                    child: Row(
                      children: [
                        const Icon(Icons.location_on_rounded),
                        SizedBox(width: 5),
                        Container(
                            width: 150,
                            child: SelectFormFieldCustom(
                              onChanged: (country) {
                                controller.setCity = country?.nome ?? '';
                                setState(() {
                                  value = controller.showWheather();
                                  //variavel local(country) x variavel global (vista pela classe inteira para todos os métodos que tiverem nessa classe)
                                });
                              },
                            )),
                        SizedBox(width: 150),
                        IconButton(onPressed: () {}, icon: Icon(Icons.calendar_today_outlined))
                      ],
                    ),
                  ),
                  Container(
                    width: 200,
                    child: Image.asset(
                      urlImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomText(text: "${item.description}", fontSize: 20),
                  CustomText(text: "${item.temperature}", fontSize: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        child: Image.asset(
                          "assets/images/windyicon.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      CustomText(text: "${item.wind}", fontSize: 20),
                      SizedBox(width: 10),
                      /* Container(
                        width: 30,
                        child: Image.asset(
                          "assets/images/rain_icon.png",
                          fit: BoxFit.cover,
                        ),
                      ), */
                      //CustomText(text: " ???? %", fontSize: 20),
                    ],
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    height: 230,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //CustomText(text: " ???Today, 7 de Mar", fontSize: 15, fontWeight: FontWeight.bold),
                            //SizedBox(height: 20),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              //padding: EdgeInsets.symmetric(horizontal: 15),
                              width: 140,
                              height: 210,
                              decoration: BoxDecoration(color: Color(0xFF8BF5F4)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //CustomText(text: "??? 9:00 AM", fontSize: 20),
                                  //SizedBox(height: 15),
                                  Container(
                                    width: 80,
                                    child: Image.asset(
                                      urlImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  CustomText(
                                    text: "${item.forecast?[index].temperature} °",
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            );
          }),
    );
  }
}
