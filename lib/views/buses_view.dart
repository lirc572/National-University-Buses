import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:national_university_buses/controllers/buses_controller.dart';
import '../controllers/busstops_controller.dart';
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
    final BusesController c = Get.put(BusesController());
    return ExpansionList(
      buildTitles: () async {
        var busRoutes = await ApiProvider.fetchBusRoutes();
        var likedBusRoutes = c.liked;
        var busRoutesReordered = [];
        // two loops to order the liked items in the same order of the liked list
        for (var likedBusRoute in likedBusRoutes) {
          for (var busRoute in busRoutes) {
            if (busRoute['Route'].toString() == likedBusRoute) {
              busRoutesReordered.add(busRoute);
            }
          }
        }
        for (var busRoute in busRoutes) {
          if (!busRoutesReordered.contains(busRoute)) {
            busRoutesReordered.add(busRoute);
          }
        }
        _updateBusRoutes(busRoutesReordered);
        return busRoutesReordered
            .map(
              (busRoute) => ListTile(
                title: Text(
                  busRoute['Route'].toString(),
                ),
                leading: GestureDetector(
                  child: Icon(
                    c.isLiked(busRoute['Route'].toString())
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: c.isLiked(busRoute['Route'].toString())
                        ? Colors.red
                        : null,
                  ),
                  onTap: () {
                    final busRouteName = busRoute['Route'].toString();
                    setState(() {
                      if (c.isLiked(busRouteName)) {
                        c.unlikeItem(busRouteName);
                      } else {
                        c.likeItem(busRouteName);
                      }
                    });
                  },
                ),
              ),
            )
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
