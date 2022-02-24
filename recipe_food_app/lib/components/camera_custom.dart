import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class CameraCustom extends StatefulWidget {
  const CameraCustom({Key? key}) : super(key: key);

  @override
  State<CameraCustom> createState() => _CameraCustomState();
}

class _CameraCustomState extends State<CameraCustom> {
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      //final imagePermanent = await saveImagePermanently(image.path);
      setState(() {
        this.image = imageTemporary;
        //this.image = imagePermanent;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 120,
      child: Stack(alignment: Alignment.bottomRight, children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(30)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: image != null
                  ? Image.file(
                      image!,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      "assets/images/empty_photo.png",
                      fit: BoxFit.cover,
                    )),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFF918AE2),
              shape: BoxShape.circle,
            ),
            child: PopupMenuButton(
              icon: Icon(
                Icons.camera_alt,
                size: 20,
                color: Colors.white,
              ),
              itemBuilder: ((_) => <PopupMenuItem>[
                    PopupMenuItem(
                        onTap: () {
                          pickImage(ImageSource.gallery);
                        },
                        value: 1,
                        child: Row(
                          children: [Icon(Icons.account_box), SizedBox(width: 3), Text('Open Gallery')],
                        )),
                    PopupMenuItem(
                      onTap: () {
                        pickImage(ImageSource.camera);
                      },
                      value: 2,
                      child: Row(
                        children: [Icon(Icons.camera), SizedBox(width: 3), Text('Open Camera')],
                      ),
                    )
                  ]),
            ),
          ),
        )
      ]),
    );
  }
}
