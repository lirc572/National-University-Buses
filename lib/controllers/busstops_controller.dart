import 'package:get/get.dart';

class BusstopsController extends GetxController{
  List<String> liked = [];
  bool isLiked(String busStopName) {
    return liked.contains(busStopName);
  }
  void likeItem(String busStopName) {
    liked.add(busStopName);
  }
  void unlikeItem(String busStopName) {
    liked.remove(busStopName);
  }
}
