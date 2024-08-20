import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayari_example/Controller/State-Manager/FontSize.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

List emoji = [
  '🌹🌷🌼😍🌻🍾🌻🍾',
  '🍅🍅🌹🌹🪷🪷🌻🍾',
  '💔💔💔😘😘💚🌻🍾',
  '🍾🍾🍻🍻🍻😔🍻😔',
  '🫂🫂😍😍🌹🌹🍻😔',
  '😍😍🥰🥰😘❤️️🍻😔',
  '💪💪💪✊✊🤛✊🤛',
  '😞🤗🤗🥱🥱😉✊🤛',
  '😎😎😎😁😁💪✊🤛',
];


class Fourth_Screen extends StatelessWidget {
  Fourth_Screen({super.key, required this.shayari123});

  final String shayari123;
  Controler c = Get.put(Controler());

  List<String> Word = [
    'BackGround',
    'Text Color',
    'Share',
    'Font',
    'Emoji',
    'Text Size',
  ];

  List<String>  Word1=[
    'Font 1',
    'Font 2',
    'Font 3',
    'Font 4',
    'Font 5',
    'Font 6',
    'Font 7',
    'Font 8',
  ];



    WidgetsToImageController imgctrl=WidgetsToImageController();
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("LOVE SHAYRI"),
        actions: [
          Icon(Icons.share),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.menu),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => WidgetsToImage(
            controller:imgctrl,
            child: Card(
              shape: Border.all(color: Colors.black, width: 3),
              margin: EdgeInsetsDirectional.fromSTEB(10, 50, 10, 200),
              color: c.backgroundcolor.value,
              child: Center(
                child: Center(
                  child: Obx(
                    () => Center(
                      child: Text(
                        '${c.emojies.value}\n${shayari123}\n${c.emojies.value}',
                        style: TextStyle(
                            fontSize: c.fontSize.value,
                            color: c.TextColor.value,
                            fontFamily: c.fontFamily.value),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 80,
            width: 130,
            color: Colors.white24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.refresh_outlined,
                    color: Colors.green,
                    size: 35,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.fullscreen, color: Colors.red, size: 35),
                ),
              ],
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.black),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                childAspectRatio: 3,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => _openBotomSheet(index),
                  ),
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        '${Word[index]}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _openBotomSheet(int index) {
    Widget child = SizedBox();
    Controler c = Get.put(Controler());

    switch (index) {
      case 0:
        child = GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8, crossAxisSpacing: 4, mainAxisSpacing: 4),
          itemBuilder: (context, index) {
            Color color = Color.fromARGB(
                Random().nextInt(255),
                Random().nextInt(255),
                Random().nextInt(255),
                Random().nextInt(255));
            return GestureDetector(
              onTap: () {
                print('++++ ${c.backgroundcolor.value.runtimeType}');
                print('++++ ${color.runtimeType}');
                c.backgroundcolor.value = color;
                Get.back();
              },
              child: Container(
                height: 10,
                width: 10,
                margin:
                EdgeInsetsDirectional.symmetric(horizontal: 5, vertical: 5),
                color: color,
                child: DecoratedBox(
                  decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
                ),
              ),
            );
          },
        );
        break;

      case 1:
        child = GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8, crossAxisSpacing: 4, mainAxisSpacing: 4),
          itemBuilder: (context, index) {
            Color color1 = Color.fromARGB(
                Random().nextInt(255),
                Random().nextInt(255),
                Random().nextInt(255),
                Random().nextInt(255));
            return GestureDetector(
              onTap: () {
                c.TextColor.value = color1;
                Get.back();
              },
              child: Container(
                height: 10,
                width: 10,
                margin:
                EdgeInsetsDirectional.symmetric(vertical: 5, horizontal: 5),
                color: color1,
                child: DecoratedBox(
                  decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
                ),
              ),
            );
          },
        );

      case 2:

            child = ListTile(
              title: const Text('Save'),
              onTap: () async {
                Uint8List? imgByt = await imgctrl.capture();
                List<int> imageData = imgByt as List<int>;
                print('+++> ${imageData}');

                _createFolder().then((path) async {
                  print('++++++++++++');
                  File file = File("$path/IMG${DateFormat('__yyyy-MM-dd_HH~mm~SS').format(DateTime.now())}.jpg");
                  file.writeAsBytes(imageData);
                  await file.create();

                  final result = await Share.shareXFiles([XFile(file.path)], text: 'Great picture');

                  if (result.status == ShareResultStatus.success) {
                    print('Thank you for sharing the picture!');
                  }
                });
                Get.back();
              },
            );




      case 3:
        child = GridView.builder(
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3,childAspectRatio: 2),
          itemCount: Word1.length,
          itemBuilder: (context, index) {
            String fontFamily = '';
            switch (index) {
              case 0:
                fontFamily = 'f1';
                break;
              case 1:
                fontFamily = 'f2';
                break;
              case 2:
                fontFamily = 'f3';
                break;
              case 3:
                fontFamily = 'f4';
                break;
              case 4:
                fontFamily = 'f5';
                break;
              case 5:
                fontFamily = 'f6';
                break;
              case 6:
                fontFamily = 'f7';
                break;
              case 7:
                fontFamily = 'f8';
                break;
            }
            return GestureDetector(
              onTap: () {
                c.fontFamily.value = fontFamily;
                Get.back();
              },
              child: Container(
                height: 30,
                width: 90,
                decoration: BoxDecoration(
                    color: Colors.white,

                    border: Border.all(color: Colors.white)),
                child: Center(
                  child: Text(
                    Word1[index],
                    style: TextStyle(fontFamily: fontFamily),
                  ),
                ),
              ),
            );
          },
        );
        break;

      case 4:
        child = GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 1,
              mainAxisSpacing: 5,
              childAspectRatio: 10),
          itemCount: emoji.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                c.emojies.value = emoji[index];
                Get.back();
              },
              child: Container(
                child: Center(
                    child: Text(
                      emoji[index],
                      style: TextStyle(fontSize: 25),
                    )),
              ),
            );
          },
        );

      case 5:
        child = Obx(
              () => Slider(
            min: 10,
            max: 40,
            value: c.fontSize.value,
            onChanged: (value) {
              c.fontSize.value = value;
            },
          ),
        );
    }

    return Container(
      height: 150,
      child: child,
    );
  }

  Future<String>  _createFolder() async {
    final Foldername='Shayri Example';
    final path =Directory("storage/emulated/0/DCIM/$Foldername");

    if(!(await path.exists())){
      path.create();
    }

    return path.path;
  }




}
