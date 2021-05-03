import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import './views/busstops_view.dart';

Future main() async {
  await DotEnv.load(fileName: "dotenv");
  runApp(GetMaterialApp(
    title: 'National University Buses',
    home: BusStopsView(),
  ));
}
