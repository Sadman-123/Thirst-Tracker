import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_tracker/controllers/water_controller.dart';
import 'package:water_tracker/screens/desktop_view.dart';
import 'package:water_tracker/screens/screens_components/desktop_notification.dart';
class DesktopCloud extends StatelessWidget{
  WaterController controller=Get.put(WaterController());
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
                height:  mdh*0.14,
                width: mdw*0.1,
              ),
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {
                          Get.to(DesktopHistory(),transition: Transition.cupertino);
                        },
                        child: Text(
                          "Notifications",
                          style: TextStyle(fontSize: mdw*0.016, color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {},
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
          Container(
            padding: EdgeInsets.all(20),
            height: mdh*0.44,
            width: mdw*0.40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black,width: 4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius:mdw*0.0285,
                  backgroundImage: AssetImage(
                      "assets/gamer.png",
                  ),
                ),
                SizedBox(height: mdh*0.04,),
                Text("Hey Guys! I have drank ${controller.sum} glasses of water",style: TextStyle(fontSize: mdw*0.0167),),
                SizedBox(height: mdh*0.04,),
                ElevatedButton(onPressed: (){Get.to(DesktopView(),transition: Transition.cupertino);}, child: Text("Upload to Cloud"))
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