import 'package:flutter/material.dart';
import 'package:water_tracker/custom_widgets/responsive_maker.dart';
import 'package:water_tracker/screens/desktop_view.dart';
import 'package:water_tracker/screens/mobile_view.dart';
import 'package:water_tracker/screens/tablet_view.dart';
void main()
{
  runApp(Main());
}
class Main extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: App(),
    );
  }
}
class App extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Responsive_Maker(
        mobile_screen: MobileView(),
        tablet_screen: TabletView(),
        desktop_screen: DesktopView()
    );
  }
}