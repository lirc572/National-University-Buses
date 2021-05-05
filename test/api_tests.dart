import 'package:flutter_test/flutter_test.dart';
import 'package:national_university_buses/util/api.dart';

void main() {
  test('fetchBusStops() test', () async {
    List busStops = await fetchBusStops();
    expect(busStops.length, greaterThan(0));
    expect(busStops[0]['caption'], isNotNull);
    expect(busStops[0]['name'], isNotNull);
  });

  test('fetchBusServices() test', () async {
    List busServices = await fetchBusServices();
    expect(busServices.length, greaterThan(0));
    expect(busServices[0]['name'], isNotNull);
    expect(busServices[0]['arrivalTime'], isNotNull);
    expect(busServices[0]['nextArrivalTime'], isNotNull);
  });

  test('fetchBusRoutes() test', () async {
    List busRoutes = await fetchBusRoutes();
    expect(busRoutes.length, greaterThan(0));
    expect(busRoutes[0]['Route'], isNotNull);
  });

  test('fetchBusPickupPoints() test', () async {
    List busPickupPoints = await fetchBusPickupPoints();
    expect(busPickupPoints.length, greaterThan(0));
    expect(busPickupPoints[0]['pickupname'], isNotNull);
    expect(busPickupPoints[0]['lat'], isNotNull);
    expect(busPickupPoints[0]['lng'], isNotNull);
  });
}
