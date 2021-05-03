import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:another_flushbar/flushbar.dart';
import '../util/utils.dart';
import '../controllers/base_controller.dart';
import 'busstops_view.dart';
import 'buses_view.dart';

class BaseView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (GetPlatform.isWeb) {
        Flushbar(
          message: "Press here to try our Android app!",
          icon: Icon(
            Icons.info_outline,
            size: 28.0,
            color: Colors.blue[300],
          ),
          duration: Duration(seconds: 3),
          leftBarIndicatorColor: Colors.blue[300],
          onTap: (_) => launchAndroidAppUrl(),
        ).show(context);
      }
    });

    return GetBuilder<BaseController>(
      init: BaseController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('National University Buses'),
          ),
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                BusStopsView(),
                BusesView(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.redAccent,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: controller.tabIndex,
            onTap: controller.changeTabIndex,
            items: [
              _navBarItems(
                label: 'Bus Stops',
                icon: ImageIcon(
                  AssetImage("images/bus_stop.png"),
                ),
              ),
              _navBarItems(
                label: 'Buses',
                icon: Icon(Icons.directions_bus_rounded),
              ),
            ],
          ),
        );
      },
    );
  }
}

_navBarItems({
  @required Widget icon,
  @required String label,
}) {
  return BottomNavigationBarItem(
    label: label,
    icon: icon,
  );
}
