import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_tracker/controllers/water_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

import 'package:water_tracker/screens/desktop_view.dart';
import 'package:water_tracker/screens/screens_components/desktop_cloud.dart';
class DesktopHistory extends StatelessWidget{
  WaterController controller =Get.put(WaterController());
  @override
  Widget build(BuildContext context) {
    var mdw=MediaQuery.of(context).size.width;
    var mdh=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/logo.png",
                height: mdh*0.14,
                width: mdw*0.1,
              ),
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {
                          Get.to(DesktopView(),transition: Transition.cupertino);
                        },
                        child: Text(
                          "Home",
                          style: TextStyle(fontSize: mdw*0.016, color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {
                          Get.to(DesktopCloud(),transition: Transition.cupertino);
                        },
                        child: Text(
                          "Cloud",
                          style: TextStyle(fontSize: mdw*0.016, color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        child: Image.asset("assets/gamer.png"),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Text("Your Notifications",style: TextStyle(fontSize: mdw*0.028,fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
          SizedBox(height: mdh*0.038,),
          Container(
            width: mdw*0.4,
            height: mdh*0.7,
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