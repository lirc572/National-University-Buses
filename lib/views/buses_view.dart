import 'package:flutter/material.dart';
import '../widgets/expansion_list.dart';
import '../util/api.dart' show ApiProvider;
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
        var busRoutes = await ApiProvider.fetchBusRoutes();
        _updateBusRoutes(busRoutes);
        return busRoutes
            .map((busRoute) => Text(busRoute['Route'].toString()))
            .toList();
      },
      buildSubList: (i) async {
        var busPickupPoints =
            await ApiProvider.fetchBusPickupPoints(_busRoutes[i]['Route']);
        return busPickupPoints
            .map((busPickupPoint) => ListTile(
                  title: Text(busPickupPoint['pickupname'].toString()),
                  leading: ImageIcon(
                    AssetImage("assets/images/bus_stop.png"),
                  ),
                  trailing: GestureDetector(
                    onTap: () => launchGoogleMaps(
                      busPickupPoint['lat'],
                      busPickupPoint['lng'],
                    ),
                    child: ClickableItem(
                      child: Icon(Icons.map_outlined),
                    ),
                  ),
                ))
            .toList();
      },
    );
  }
}
