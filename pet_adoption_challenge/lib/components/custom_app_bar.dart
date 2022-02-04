import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String imagePath;
  final String location;

  const CustomAppBar(this.location, {Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            size: 40,
          ),
        ),
        Column(
          children: [
            const Text(
              'Location',
              style: TextStyle(fontSize: 15.0),
            ),
            Text(
              location,
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            )
          ],
        ),
        CircleAvatar(
          foregroundColor: Colors.transparent,

          radius: 40,
          //backgroundImage: NetworkImage('assets/images/avatar.png'),
          backgroundColor: Colors.white,
          child: Image.asset(
            imagePath,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
