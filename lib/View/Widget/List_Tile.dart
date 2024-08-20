import 'package:flutter/material.dart';
import 'package:shayari_example/Model/Data_Model/Shayri_Data.dart';
import 'package:shayari_example/View/Text/MediumText.dart';

import 'Image.dart';

class Shayri_List_Tile extends StatelessWidget {
  Shayri_List_Tile({super.key, required this.shayriData, required this.onTap});

  final ShayriData shayriData;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: shayriData.imagePath != null
          ? Build_Image(imagePath: shayriData.imagePath!)
          : null,
      title: shayriData.title != null
          ? Medium_Text(text: shayriData.title!,maxline: 2,)
          : null,
      trailing: Padding(

        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.arrow_forward_ios,
          color: Colors.black,
          size:25,
        ),
      ),
    );
  }
}
