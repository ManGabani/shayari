import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shayari_example/Model/Data_Model/Shayri_Data.dart';
import 'package:shayari_example/Model/constant/Shayri_Stroage.dart';
import 'package:shayari_example/View/Screen/Third_Screen.dart';
import 'package:shayari_example/View/Widget/List_Tile.dart';

import '../../Model/constant/insert.dart';

class home_Screen extends StatelessWidget with Insert, ShayriStroage {
  home_Screen({super.key, required this.mainIndex});

  final int mainIndex;

  @override
  Widget build(BuildContext context) {
    List emoji = [
      '🌹🌷🌼😍🌻🍾🍻',
      '🍅🍅🌹🌹🪷🪷😍',
      '💔💔💔😘😘💚💚',
      '🍾🍾🍻🍻🍻😔😔',
      '🫂🫂😍😍🌹🌹🫂',
      '😍😍🥰🥰😘❤️❤️',
      '💪💪💪✊✊🤛😆',
      '😞🤗🤗🥱🥱😉😉',
      '😎😎😎😁😁💪💪',
    ];

    final List shayri = <List<Map<String, String>>>[
      List0,
      List1,
      List2,
      List3,
      List4,
      List5,
      List6,
      List7,
      List8
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('${AppList[mainIndex]['title']}'),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView.separated(
          itemBuilder: (context, index) => Container(
            height: 80,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255,216,169,10),

              border: Border.all(color: Colors.black, width:6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Shayri_List_Tile(
              onTap: () {
                Get.to(Third_Screen(
                  shayaries: shayri[mainIndex].map((e) => e['title'].toString()).toList(),
                  initialPage: index, main: mainIndex,
                  ),
                );
              },
              shayriData: ShayriData.fromJson(shayri[mainIndex][index]),
            ),
          ),
          separatorBuilder: (context, index) => verticalSpace,
          itemCount: shayri[mainIndex].length,
        ),
      ),
    );
  }
}
