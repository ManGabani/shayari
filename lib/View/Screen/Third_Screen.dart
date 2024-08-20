
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayari_example/View/Screen/Fourth_Screen.dart';

import '../../Controller/State-Manager/FontSize.dart';

class Third_Screen extends StatelessWidget {
  Third_Screen({super.key, required this.shayaries, required this.initialPage,required this.main});

  final List shayaries;
  final int initialPage;
  final int main;
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: initialPage);
    int currentPage = initialPage;
    Controler c = Get.put(Controler());

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
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: controller,
            itemCount: shayaries.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Card(
                    margin: EdgeInsetsDirectional.fromSTEB(10, 50, 10, 50),
                    color: Color.fromRGBO(241, 166, 97, 10),
                    child: Center(
                      child: Text(

                        '    ${emoji[main]}\n${shayaries[index]}\n   ${emoji[main]}',
                        style: TextStyle(fontSize: 25),
                      ),

                    ),
                  ),
                ],
              );
            },
            onPageChanged: (value) {
              currentPage = value;
            },
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 50,
              color: Colors.white24,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.refresh_outlined, color: Colors.green, size: 35,),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.fullscreen, color: Colors.red, size: 35),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
        height: 50,
        color: Colors.green.shade700,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildcopybtn(context, shayaries[currentPage]),
            IconButton(
              onPressed: () {
                if (currentPage > 0) {
                  currentPage--;
                }
                controller.previousPage(
                    duration: Duration(milliseconds: 800), curve: Curves.ease);
              },
              icon: Icon(
                Icons.keyboard_arrow_left,
                size: 40,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Get.to(() => Fourth_Screen(shayari123: shayaries[currentPage]));
              },
              icon: Icon(
                Icons.edit_off,
                color: Colors.white,
                size: 40,
              ),
            ),
            IconButton(
              onPressed: () {
                if (currentPage < 0) {
                  currentPage++;
                }
                controller.nextPage(
                    duration: Duration(milliseconds: 800), curve: Curves.ease);
              },
              icon: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
                size: 40,
              ),
            ),
            IconButton(
              onPressed: () {
                Share.share(shayaries[currentPage]);
              },
              icon: Icon(
                Icons.share,
                size: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildcopybtn(BuildContext context, String shayri) {
  return GestureDetector(
    onTap: () {
      FlutterClipboard.copy(shayri).then((value) {
        Fluttertoast.showToast(
          msg: "Copied",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      });
    },
    child: Icon(
      Icons.file_copy_sharp,
      size: 30,
      color: Colors.white,
    ),
  );
}
