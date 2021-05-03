import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:national_university_buses/views/base_view.dart';

Future main() async {
  await DotEnv.load(fileName: "dotenv");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'National University Buses',
      home: BaseView(),
    );
  }
}
