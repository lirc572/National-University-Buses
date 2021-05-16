import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/busstops_controller.dart';
import '../widgets/expansion_list.dart';
import '../util/api.dart' show ApiProvider;

class BusStopsView extends StatefulWidget {
  @override
  _BusStopsViewState createState() => _BusStopsViewState();
}

class _BusStopsViewState extends State<BusStopsView> {
  List _busStops = [];

  void _updateBusStops(List newBusStops) {
    _busStops = newBusStops;
  }

  String _formatArrivalTimes(String time1, String time2) {
    int time1Int, time2Int;

    try {
      time1Int = int.parse(time1);
    } on FormatException {
      time1Int = -1;
    }
    if (time1Int > 99) {
      time1Int = -1;
    }

    try {
      time2Int = int.parse(time2);
    } on FormatException {
      time2Int = -1;
    }
    if (time2Int > 99) {
      time2Int = -1;
    }

    if (time1Int < 0 && time2Int < 0) {
      return 'not available';
    }
    if (time1Int < 0) {
      return '$time2Int min';
    }
    if (time2Int < 0) {
      return '$time1Int min';
    }
    return '$time1Int min, $time2Int min';
  }

  @override
  Widget build(BuildContext context) {
    final BusstopsController c = Get.put(BusstopsController());
    return ExpansionList(
      buildTitles: () async {
        var busStops = await ApiProvider.fetchBusStops();
        var likedBusStops = c.liked;
        var busStopsReordered = [];
        // for (var busStop in busStops) {
        //   if (likedBusStops.contains(busStop['caption'].toString())) {
        //     busStopsReordered.add(busStop);
        //   }
        // }
        for (var likedBusStop in likedBusStops) {
          for (var busStop in busStops) {
            if (busStop['caption'].toString() == likedBusStop) {
              busStopsReordered.add(busStop);
            }
          }
        }
        for (var busStop in busStops) {
          if (!busStopsReordered.contains(busStop)) {
            busStopsReordered.add(busStop);
          }
        }
        _updateBusStops(busStopsReordered);
        return busStopsReordered
            .map(
              (busStop) => ListTile(
                title: Text(
                  busStop['caption'].toString(),
                ),
                leading: GestureDetector(
                  child: Icon(
                    c.isLiked(busStop['caption'].toString())
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: c.isLiked(busStop['caption'].toString())
                        ? Colors.red
                        : null,
                  ),
                  onTap: () {
                    final busStopName = busStop['caption'].toString();
                    setState(() {
                      if (c.isLiked(busStopName)) {
                        c.unlikeItem(busStopName);
                      } else {
                        c.likeItem(busStopName);
                      }
                    });
                  },
                ),
              ),
            )
            .toList();
      },
      buildSubList: (i) async {
        var busServices =
            await ApiProvider.fetchBusServices(_busStops[i]['name']);
        return busServices
            .map((busRoute) => ListTile(
                  title: Text(busRoute['name'].toString()),
                  leading: Icon(Icons.directions_bus_rounded),
                  trailing: Text(_formatArrivalTimes(
                      busRoute['arrivalTime'].toString(),
                      busRoute['nextArrivalTime'].toString())),
                ))
            .toList();
      },
    );
  }
}
