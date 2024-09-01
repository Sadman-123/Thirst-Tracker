import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:water_tracker/screens/mobile_view.dart';
import 'package:water_tracker/screens/screens_components/mobile_notification.dart';

import '../../controllers/water_controller.dart';
import 'mobile_cloud.dart';
class MobileHealth extends StatelessWidget{
  final WaterController waterController = Get.put(WaterController());

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/logo.png",height: 100,),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(accountName: Text(""), accountEmail: Text(""),currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/gamer.png"),
            ),
              decoration: BoxDecoration(
                  color: Colors.white60
              ),),
            ListTile(
              onTap: (){
                Get.offAll(MobileView(),transition: Transition.cupertino);
              },
              title: Text("Home",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            ),
            ListTile(
              onTap: (){
                Get.offAll(MobileNotification(),transition: Transition.cupertino);
              },
              title: Text("Notifications",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            ),
            ListTile(
              onTap: (){
                Get.offAll(MobileCloud(),transition: Transition.cupertino);
              },
              title: Text("Cloud",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Obx(()=>Text(waterController.sum<8?"Fill me up!":"Awesome!!",style: TextStyle(fontSize: 50,fontWeight: FontWeight.w500),),),
            Obx(()=>Text(waterController.sum<8?"Drink atleast ${waterController.total_healthy_limit.value-waterController.sum.value} more glasses!":"You have drank  ${waterController.sum} glasses of water \nThats a good sign of great health",style: TextStyle(fontSize: 21,color: Colors.grey.shade600),),),
            Obx(
                  () {
                double fillPercent = waterController.sum.value / 8;
                double clipHeight = 400 * (1 - fillPercent);
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SvgPicture.asset(
                      "assets/human.svg",
                      height: 300,
                      color: Colors.blue.withOpacity(0.2),
                    ),
                    ClipPath(
                      clipper: WaterClipper(clipHeight),
                      child: SvgPicture.asset(
                        "assets/human.svg",
                        height: 300,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.defaultDialog(
              title: "Drink Water",
              titleStyle: TextStyle(fontWeight: FontWeight.bold),
              cancel: TextButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: Text("Close")),
              content: Text("Drinking water is essential for overall health. It helps maintain hydration, supports digestion, regulates body temperature, flushes out toxins, and improves skin health. Adequate water intake also boosts energy levels, enhances cognitive function, and aids in weight management by promoting a feeling of fullness.")
          );
        },
        child: Icon(Icons.question_answer),
      ),

    );
  }
}
class WaterClipper extends CustomClipper<Path> {
  final double clipHeight;
  WaterClipper(this.clipHeight);
  @override
  Path getClip(Size size) {
    return Path()
      ..addRect(Rect.fromLTRB(0, clipHeight, size.width, size.height));
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}