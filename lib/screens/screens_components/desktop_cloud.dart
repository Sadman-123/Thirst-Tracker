import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_tracker/controllers/water_controller.dart';
import 'package:water_tracker/screens/desktop_view.dart';
class DesktopCloud extends StatelessWidget{
  WaterController controller=Get.put(WaterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/logo.png",
                height: 100,
                width: 100,
              ),
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "History",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Cloud",
                          style: TextStyle(fontSize: 20, color: Colors.black),
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
            height: 280,
            width: 500,
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
                SizedBox(height: 10,),
                Text("Hey Guys! I have drank ${controller.sum} glasses of water",style: TextStyle(fontSize: 23),),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: (){Get.to(DesktopView());}, child: Text("Upload to Cloud"))
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