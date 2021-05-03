import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:another_flushbar/flushbar.dart';
import '../widgets/bus_stop_list.dart';
import '../util/utils.dart';
import '../controllers/controller.dart';
import 'buses_view.dart';

class BusStopsView extends StatelessWidget {
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
          onTap: (_) => launchAndroidAppUrl(),
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
        onPressed: () => Get.to(BusesView()),
      ),
    );
  }
}
