import 'package:url_launcher/url_launcher.dart';

void launchAndroidAppUrl() async {
  var _url = 'https://github.com/lirc572/National-University-Buses/releases';
  await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
}

void launchGoogleMaps(double lat, double lng) async {
  var _url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
  await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
}
