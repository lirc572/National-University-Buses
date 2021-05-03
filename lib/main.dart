import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:another_flushbar/flushbar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgets/bus_stop_list.dart';

Future main() async {
  await DotEnv.load(fileName: "dotenv");
  runApp(GetMaterialApp(
    title: 'National University Buses',
    home: Home(),
  ));
}

void _launchAndroidAppUrl() async {
  var _url = 'https://github.com/lirc572/National-University-Buses/releases';
  await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
}

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

class Home extends StatelessWidget {
  @override
  Widget build(context) {
    // ignore: unused_local_variable
    final Controller c = Get.put(Controller());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (GetPlatform.isWeb) {
        Flushbar(
          message: "Press here to try our Android app!",
          icon: Icon(
            Icons.info_outline,
            size: 28.0,
            color: Colors.blue[300],
          ),
          duration: Duration(seconds: 5),
          leftBarIndicatorColor: Colors.blue[300],
          onTap: (_) => _launchAndroidAppUrl(),
        ).show(context);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('National University Buses'),
      ),
      body: BusStopList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.all_inclusive),
        onPressed: () => Get.to(Other()),
      ),
    );
  }
}

class Other extends StatelessWidget {
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
