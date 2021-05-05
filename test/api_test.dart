import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:national_university_buses/util/api.dart' show ApiProvider;
import 'util/mock_api.dart' show mockApiClient;

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await DotEnv.load(fileName: "dotenv");
    ApiProvider.setClient(mockApiClient);
  });

  test('fetchBusStops() test', () async {
    List busStops = await ApiProvider.fetchBusStops();
    expect(busStops.length, greaterThan(0));
    expect(busStops[0]['caption'], isNotNull);
    expect(busStops[0]['name'], isNotNull);
  });

  test('fetchBusServices() test', () async {
    List busServices = await ApiProvider.fetchBusServices('COM2');
    expect(busServices.length, greaterThan(0));
    expect(busServices[0]['name'], isNotNull);
    expect(busServices[0]['arrivalTime'], isNotNull);
    expect(busServices[0]['nextArrivalTime'], isNotNull);
  });

  test('fetchBusRoutes() test', () async {
    List busRoutes = await ApiProvider.fetchBusRoutes();
    expect(busRoutes.length, greaterThan(0));
    expect(busRoutes[0]['Route'], isNotNull);
  });

  test('fetchBusPickupPoints() test', () async {
    List busPickupPoints = await ApiProvider.fetchBusPickupPoints('BTC1');
    expect(busPickupPoints.length, greaterThan(0));
    expect(busPickupPoints[0]['pickupname'], isNotNull);
    expect(busPickupPoints[0]['lat'], isNotNull);
    expect(busPickupPoints[0]['lng'], isNotNull);
  });
}
