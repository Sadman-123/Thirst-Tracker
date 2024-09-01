import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_tracker/screens/mobile_view.dart';
import 'package:water_tracker/screens/screens_components/mobile_health.dart';

import 'mobile_cloud.dart';
class MobileNotification extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                Get.offAll(MobileHealth(),transition: Transition.cupertino);
              },
              title: Text("Health",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            ),
            ListTile(
              onTap: (){
                Get.offAll(MobileView(),transition: Transition.cupertino);
              },
              title: Text("Home",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
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
      body: Column(
        children: [
          SizedBox(height: 30,),
          Text("Your Notifications",style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
          SizedBox(height: 20,),
          Container(
            width: 650,
            height: 600,
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return ListTile(
                        trailing: Icon(Icons.check),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage("assets/man.png"),
                        ),
                        title: Text("Hey man! Time for water",style: TextStyle(fontWeight: FontWeight.bold),),
                        subtitle: Text("12:00 AM"),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(height: 0.5,);
                    },
                  ),
                )
              ],
            ),
          )
        ],
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