import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_tracker/controllers/water_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_svg/svg.dart';
import 'package:water_tracker/screens/screens_components/desktop_cloud.dart';

class DesktopView extends StatelessWidget {
  final WaterController waterController = Get.put(WaterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                        onPressed: () {
                          Get.to(DesktopCloud(),transition: Transition.cupertino);
                        },
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
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                width: 430,
                height: 500,
                child: Column(
                  children: [
                    Text(
                      "Track your Water Sip!",
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: waterController.ct,
                      decoration: InputDecoration(
                        hintText: "How much Glasses of Water you Drank?",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        waterController.water_add();
                      },
                      child: Text("Track my glass"),
                    ),
                    Expanded(
                      child: Obx(
                            () => ListView.builder(
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
                                height: 40,
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  waterController.water_delete(index);
                                },
                                icon: Icon(Icons.delete),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
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
              ),
            ],
          ),
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
