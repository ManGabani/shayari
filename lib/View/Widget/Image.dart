import 'package:flutter/material.dart';

class Build_Image extends StatelessWidget {
  const Build_Image({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:70,
      height:40,
      child: Container(
        margin: EdgeInsetsDirectional.fromSTEB(10,0, 0, 0),
        width: 50,
        height:80,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover
          ),
        ),
      ),
    );
  }
}
