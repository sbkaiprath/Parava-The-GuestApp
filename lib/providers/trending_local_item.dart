import 'package:flutter/foundation.dart';

class TrendingLocalItem with ChangeNotifier {
  final String id;
  final String imageUrl;
  final String title;
  final String description;
  final String place;
  bool isFavorite;
  TrendingLocalItem(
      {@required this.id,
      @required this.description,
      @required this.title,
      @required this.place,
      this.isFavorite = false,
      @required this.imageUrl});
  void checkFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
