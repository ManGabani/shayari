import 'package:flutter/material.dart';

class Medium_Text extends StatelessWidget {
  Medium_Text({super.key, required this.text,this.maxline});

  final String text;
  final int? maxline;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
        color: Colors.black, fontWeight: FontWeight.w400, fontSize: 20),maxLines: maxline,
      ),

    );
  }
}
