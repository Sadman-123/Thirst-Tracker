import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_tracker/controllers/water_controller.dart';
import 'package:water_tracker/screens/screens_components/mobile_cloud.dart';
import 'package:water_tracker/screens/screens_components/mobile_health.dart';
import 'package:water_tracker/screens/screens_components/mobile_notification.dart';
class MobileView extends StatelessWidget{
  WaterController waterController=Get.put(WaterController());
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
                Get.offAll(MobileCloud(),transition: Transition.cupertino);
              },
              title: Text("Cloud",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
            )
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Text(
              "Track your Water Sip!",
              style: TextStyle(fontSize: mdw*0.080, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: mdh*0.03,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 40,
                right: 40
              ),
              child: TextField(
                controller: waterController.ct,
                decoration: InputDecoration(
                  hintText: "How much Glasses of Water?",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: mdh*0.03,
            ),
            ElevatedButton(
              onPressed: () {
                waterController.water_add();
              },
              child: Text("Track my glass"),
            ),
            Expanded(
              child: Obx(() => ListView.separated(
                itemCount: waterController.arr.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      "${waterController.arr[index]['item']} glasses of water",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        "${waterController.arr[index]['time']} ${waterController.arr[index]['date']}"),
                    leading: Image.asset(
                      "assets/water.png",
                      height: mdh*0.075,
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        waterController.water_delete(index);
                      },
                      icon: Icon(Icons.delete),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(),
              )
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.question_answer),),
    );
  }
}