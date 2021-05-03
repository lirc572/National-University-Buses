import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/controller.dart';

class BusesView extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(
      body: Center(child: Obx(() => Text("${c.count}"))),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: c.increment),
    );
  }
}
