import 'package:flutter/material.dart';
import '../util/api.dart';

class BusStopList extends StatefulWidget {
  @override
  _BusStopListState createState() => _BusStopListState();
}

class _BusStopListState extends State<BusStopList> {
  final _biggerFont = TextStyle(fontSize: 18.0);
  List _busStops = [];
  List<String> get _busStopNames {
    return _busStops.map((busStop) => busStop['caption'].toString()).toList();
  }

  void _updateBusStops(List newBusStops) {
    _busStops = newBusStops;
  }

  Widget _buildRow(String busStopName) {
    return ListTile(
      title: Text(
        busStopName,
        style: _biggerFont,
      ),
    );
  }

  Widget _buildList() {
    final lengthOfList =
        _busStopNames.length > 0 ? _busStopNames.length * 2 - 1 : 0;
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: lengthOfList,
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2;
        return _buildRow(_busStopNames[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchBusStops(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        Widget widget = Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: CircularProgressIndicator(),
                height: 60.0,
                width: 60.0,
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Fetching bus stop list...'),
              ),
            ],
          ),
        );
        if (snapshot.hasData) {
          _updateBusStops(snapshot.data);
          widget = _buildList();
        } else if (snapshot.hasError) {
          widget = Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Please check your internet connection'),
                ),
              ],
            ),
          );
        }
        return widget;
      },
    );
  }
}
