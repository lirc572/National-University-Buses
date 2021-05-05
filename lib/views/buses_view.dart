import 'package:flutter/material.dart';
import '../widgets/expansion_list.dart';
import '../util/api.dart';
import '../util/utils.dart' show launchGoogleMaps;
import '../widgets/clickable_item.dart';

class BusesView extends StatefulWidget {
  @override
  _BusesViewState createState() => _BusesViewState();
}

class _BusesViewState extends State<BusesView> {
  List _busRoutes = [];

  void _updateBusRoutes(List newBusRoutes) {
    _busRoutes = newBusRoutes;
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionList(
      buildTitles: () async {
        var busRoutes = await fetchBusRoutes();
        _updateBusRoutes(busRoutes);
        return busRoutes
            .map((busRoute) => Text(busRoute['Route'].toString()))
            .toList();
      },
      buildSubList: (i) async {
        var busServices = await fetchBusPickupPoints(_busRoutes[i]['Route']);
        return busServices
            .map((busRoute) => ListTile(
                  title: Text(busRoute['pickupname'].toString()),
                  leading: ImageIcon(
                    AssetImage("assets/images/bus_stop.png"),
                  ),
                  trailing: GestureDetector(
                    onTap: () => launchGoogleMaps(
                      busRoute['lat'],
                      busRoute['lng'],
                    ),
                    child: ClickableItem(
                      child: Text(
                        '( ${busRoute['lat']}, ${busRoute['lng']} )',
                      ),
                    ),
                  ),
                ))
            .toList();
      },
    );
  }
}
