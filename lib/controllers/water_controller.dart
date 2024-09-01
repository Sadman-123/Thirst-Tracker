import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
class WaterController extends GetxController{
 RxList arr=[].obs;
 RxInt sum=0.obs;
 RxInt total_healthy_limit=8.obs;
 TextEditingController ct=TextEditingController();
 void water_add()
 {
   sum.value+=int.parse(ct.text);
   arr.add(
     {
     "item": ct.text.toString(),
     "time":"${DateFormat('HH:mm').format(DateTime.now())}",
       "date":"${DateFormat('dd/MM/yyyy').format(DateTime.now())}"
     }
   );
   ct.clear();
 }
 void water_delete(int index)
 {
   sum.value=sum.value-int.parse(arr[index]['item'].toString());
   arr.removeAt(index);
 }
}