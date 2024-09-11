import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:water_tracker/controllers/water_controller.dart';
import 'package:water_tracker/screens/mobile_view.dart';
import 'package:water_tracker/screens/screens_components/mobile_health.dart';
import 'package:water_tracker/screens/screens_components/mobile_notification.dart';
class MobileCloud extends StatelessWidget{
  WaterController controller=Get.put(WaterController());
  @override
  Widget build(BuildContext context) {
    var mdw=MediaQuery.of(context).size.width;
    var mdh=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/logo.png",height: mdh*0.16,),
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
                Get.offAll(MobileHealth(),transition: Transition.cupertino);
              },
              title: Text("Health",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            ),
            ListTile(
              onTap: (){
                Get.offAll(MobileNotification(),transition: Transition.cupertino);
              },
              title: Text("Notifications",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            ),
            ListTile(
              onTap: (){
                Get.offAll(MobileView(),transition: Transition.cupertino);
              },
              title: Text("Home",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
            )
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(21),
        height: mdh*0.434,
        width: mdw*0.90,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black,width: 4),
          borderRadius: BorderRadius.circular(20),

        ),
        child: Column(
          children: [
            CircleAvatar(
              radius:40,
              backgroundImage: AssetImage(
                "assets/gamer.png",
              ),
            ),
            SizedBox(height: mdh*0.03,),
            Text("Hey Guys! I have drank ${controller.sum} glasses of water",style: TextStyle(fontSize: mdw*0.06),),
            SizedBox(height: mdh*0.03,),
            ElevatedButton(onPressed: (){Get.offAll(MobileView(),transition: Transition.cupertino);}, child: Text("Upload to Cloud"))
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