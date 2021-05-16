import 'package:get/get.dart';

class BusesController extends GetxController {
  List<String> liked = [];
  bool isLiked(String busRouteName) {
    return liked.contains(busRouteName);
  }
  void likeItem(String busRouteName) {
    liked.add(busRouteName);
  }
  void unlikeItem(String busRouteName) {
    liked.remove(busRouteName);
  }
}
