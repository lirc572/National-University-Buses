import 'package:flutter/material.dart';
import '../widgets/expansion_list.dart';
import '../util/api.dart';

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
    return ExpansionList(
      buildTitles: () async {
        var busStops = await fetchBusStops();
        _updateBusStops(busStops);
        return busStops
            .map((busStop) => Text(busStop['caption'].toString()))
            .toList();
      },
      buildSubList: (i) async {
        var busServices = await fetchBusServices(_busStops[i]['name']);
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
