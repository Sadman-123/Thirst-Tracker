import 'package:flutter/material.dart';
class Responsive_Maker extends StatelessWidget{
  final Widget mobile_screen;
  final Widget? tablet_screen;
  final Widget desktop_screen;
  Responsive_Maker({required this.mobile_screen, required this.tablet_screen, required this.desktop_screen});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder:(context, constraints) {
      if(constraints.maxWidth<640)
        {
          return mobile_screen;
        }
      else if(constraints.maxWidth>=640 && constraints.maxWidth<1008)
        {
          return tablet_screen??mobile_screen;
        }
      else{
        return desktop_screen;
      }
    },);
  }
}