import 'package:flutter/foundation.dart';

class HomestayService with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double amount;
  final String imageurl;
  bool isFavorite = false;
  HomestayService(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.amount,
      @required this.imageurl,
      this.isFavorite=false});
  void toggleFavorite(String id) {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
