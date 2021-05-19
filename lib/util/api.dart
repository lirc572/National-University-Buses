import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'dart:io';

class ApiProvider {
  static final _baseUrl = 'nnextbus.nus.edu.sg';

  static final _tokenEncoded = DotEnv.env['TOKEN_ENCODED'];

  static final _headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Basic ' + _tokenEncoded,
  };

  static var _client = http.Client();

  static void setClient(http.Client client) {
    _client = client;
  }

  static Future<List> fetchBusStops() async {
    var uri = Uri.https(_baseUrl, 'BusStops');
    try {
      var response = await _client.get(uri, headers: _headers);
      var busStops = jsonDecode(response.body)['BusStopsResult']['busstops'];
      return busStops;
    } on SocketException catch (_) {
      return [];
    }
  }

  static Future<List> fetchBusServices(String busStopName) async {
    var uri = Uri.https(
      _baseUrl,
      'ShuttleService',
      {
        'busstopname': busStopName,
      },
    );
    try {
      var response = await _client.get(uri, headers: _headers);
      var busStops =
          jsonDecode(response.body)['ShuttleServiceResult']['shuttles'];
      return busStops;
    } on SocketException catch (_) {
      return [];
    }
  }

  static Future<List> fetchBusRoutes() async {
    var uri = Uri.https(_baseUrl, 'ServiceDescription');
    try {
      var response = await _client.get(uri, headers: _headers);
      var busRoutes = jsonDecode(response.body)['ServiceDescriptionResult']
          ['ServiceDescription'];
      return busRoutes;
    } on SocketException catch (_) {
      return [];
    }
  }

  static Future<List> fetchBusPickupPoints(String busRoute) async {
    var uri = Uri.https(
      _baseUrl,
      'PickupPoint',
      {
        'route_code': busRoute,
      },
    );
    try {
      var response = await _client.get(uri, headers: _headers);
      var busPickupPoints =
          jsonDecode(response.body)['PickupPointResult']['pickuppoint'];
      return busPickupPoints;
    } on SocketException catch (_) {
      return [];
    }
  }
}
