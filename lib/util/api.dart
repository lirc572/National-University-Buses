import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'dart:io';

const _baseUrl = 'nnextbus.nus.edu.sg';

var _tokenEncoded = DotEnv.env['TOKEN_ENCODED'];

var _headers = {
  'Accept': 'application/json',
  'Content-Type': 'application/json',
  'Authorization': 'Basic ' + _tokenEncoded,
};

Future<List> fetchBusStops() async {
  var uri = Uri.https(_baseUrl, 'BusStops');
  try {
    var response = await http.get(uri, headers: _headers);
    var busStops = jsonDecode(response.body)['BusStopsResult']['busstops'];
    return busStops;
  } on SocketException catch (_) {
    return [];
  }
}

Future<List> fetchBusServices(String busStopName) async {
  var uri = Uri.https(
    _baseUrl,
    'ShuttleService',
    {
      'busstopname': busStopName,
    },
  );
  try {
    var response = await http.get(uri, headers: _headers);
    var busStops =
        jsonDecode(response.body)['ShuttleServiceResult']['shuttles'];
    return busStops;
  } on SocketException catch (_) {
    return [];
  }
}
