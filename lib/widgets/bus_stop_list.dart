import 'package:flutter/material.dart';
import './expansion_list.dart';
import '../util/api.dart';

class BusStopList extends StatefulWidget {
  @override
  _BusStopListState createState() => _BusStopListState();
}

class _BusStopListState extends State<BusStopList> {
  List _busStops = [];

  void _updateBusStops(List newBusStops) {
    _busStops = newBusStops;
  }

  String _formatArrivalTimes(String time1, String time2) {
    if (time1.length > 2) {
      time1 = '-';
    } else {
      time1 = time1.length == 1 ? ' ' + time1 : time1;
    }
    if (time1 != ' -') {
      time1 = time1 + 'min';
    }
    if (time2.length > 2) {
      time2 = '-';
    } else {
      time2 = time2.length == 1 ? ' ' + time2 : time2;
    }
    if (time2 != ' -') {
      time2 = time2 + 'min';
    }
    if (time1 == ' -') {
      if (time2 == ' -') {
        return 'not available';
      }
      return time2;
    }
    if (time2 == ' -') {
      return time1;
    }
    return time1 + ', ' + time2;
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionList(
      buildTitles: () async {
        var busStops = await fetchBusStops();
        _updateBusStops(busStops);
        return busStops
            .map((busStop) => new Text(busStop['caption'].toString()))
            .toList();
      },
      buildSubList: (i) async {
        var busServices = await fetchBusServices(_busStops[i]['name']);
        return busServices
            .map((busRoute) => new ListTile(
                  title: Text(busRoute['name'].toString()),
                  leading: new Icon(Icons.directions_bus_rounded),
                  trailing: new Text(_formatArrivalTimes(
                      busRoute['arrivalTime'].toString(),
                      busRoute['nextArrivalTime'].toString())),
                ))
            .toList();
      },
    );
  }
}
