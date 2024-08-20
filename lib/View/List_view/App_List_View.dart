import 'package:shayari_example/Model/Data_Model/Shayri_Data.dart';
import 'package:shayari_example/Model/constant/Shayri_Stroage.dart';
import 'package:shayari_example/Model/constant/insert.dart';
import 'package:flutter/material.dart';
import 'package:shayari_example/View/Widget/List_Tile.dart';


class App_List_view extends StatelessWidget with ShayriStroage,Insert{

App_List_view({super.key,required this.shayriData});
final List<ShayriData> shayriData;


@override
Widget build(BuildContext context) {
  return ListView.separated(itemBuilder: (context, index) =>
      Container(
        child: Shayri_List_Tile(shayriData: shayriData[index], onTap: () {  },
        ),
      ),
    separatorBuilder: (context, index) => verticalSpace,
    itemCount: shayriData.length);
}}
