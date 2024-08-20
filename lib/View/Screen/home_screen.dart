import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shayari_example/Model/Data_Model/Shayri_Data.dart';
import 'package:shayari_example/Model/constant/Shayri_Stroage.dart';
import 'package:shayari_example/Model/constant/insert.dart';
import 'package:shayari_example/View/List_view/App_List_View.dart';
import 'package:shayari_example/View/Screen/Second_Screen.dart';
import 'package:shayari_example/View/Widget/List_Tile.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class CalculatorHome extends StatelessWidget with ShayriStroage, Insert {
  CalculatorHome({super.key});

  // BannerAd? _bannerAd;
  RxBool _isLoaded = false.obs;

  @override
  Widget build(BuildContext context) {
    _handlePermission();
    return Scaffold(
      appBar: AppBar(
        title: Text('Love Shayri'),
        actions: [
          Icon(Icons.share),
          SizedBox(width: 20),
          Icon(Icons.menu),
          SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView.separated(
          itemBuilder: (context, index){
            if (index%4==3){
              BannerAd    _bannerAd = BannerAd(
                adUnitId: 'ca-app-pub-3940256099942544/6300978111',
                request: const AdRequest(),
                size: AdSize.banner,
                listener: BannerAdListener(
                  onAdLoaded: (ad) {
                    debugPrint('$ad loaded.');
                    _isLoaded.value = true;
                  },
                  onAdFailedToLoad: (ad, err){
                    debugPrint('BannerAd failed to load: $err');
                    ad.dispose();
                  },
                ),
              )..load();

              return Obx(() => _isLoaded.value
                  ? Container(
                      alignment: Alignment.center,
                      width: _bannerAd!.size.width.toDouble(),
                      height: _bannerAd!.size.height.toDouble(),
                      child:AdWidget(ad: _bannerAd!),
                    ):CircularProgressIndicator()
              );
            }

            return Container(
              height: 80,
              decoration: BoxDecoration(
                color: Color.fromRGBO(253, 238, 220, 10),
                border: Border.all(color: Colors.black, width: 6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Shayri_List_Tile(
                shayriData: ShayriData.fromJson(AppList[index]),
                onTap: (){
                  Get.to(home_Screen(mainIndex: index)
                  );
                },
              ),
            );
          },
          separatorBuilder:(context, index)=> verticalSpace,
          itemCount: AppList.length,
        ),
      ),
    );
  }

  Future<void> _handlePermission() async{
    var status = await Permission.photos.status;
    if (status == PermissionStatus.denied){
      await Permission.photos.request();
    }
    var status1 = await Permission.manageExternalStorage.status;
    if (status1 == PermissionStatus.denied){
      await Permission.manageExternalStorage.request();
    }
  }
}
