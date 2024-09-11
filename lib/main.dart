import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_tracker/custom_widgets/responsive_maker.dart';
import 'package:water_tracker/screens/desktop_view.dart';
import 'package:water_tracker/screens/mobile_view.dart';
void main() {
  runApp(Main());
}
class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.blueAccent.shade400,
              foregroundColor: Colors.white),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Colors.blueAccent.shade400),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            shadowColor: MaterialStateProperty.all(Colors.black),
            elevation: WidgetStatePropertyAll(2),
          )),
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all(Colors.blueAccent)))),
      debugShowCheckedModeBanner: false,
      home: App(),
    );
  }
}
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive_Maker(
        mobile_screen: MobileView(),
        desktop_screen: DesktopView());
  }
}