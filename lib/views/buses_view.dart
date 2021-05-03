import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/buses_controller.dart';

class BusesView extends StatelessWidget {
  final BusesController controller = Get.put(BusesController());
  @override
  Widget build(BuildContext context) {
    // Access the updated count variable
    return Scaffold(
      body: Center(child: Obx(() => Text("${controller.count}"))),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), onPressed: controller.increment),
    );
  }
}
