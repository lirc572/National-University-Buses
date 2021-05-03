import 'package:url_launcher/url_launcher.dart';

void launchAndroidAppUrl() async {
  var _url = 'https://github.com/lirc572/National-University-Buses/releases';
  await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
}
