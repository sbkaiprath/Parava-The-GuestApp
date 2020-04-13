import 'package:flutter/material.dart';

class DiscoverLocalItem with ChangeNotifier{
  final String title;
  final String id;
  final String imageUrl;
  final String description;
  bool isFavorite;
  DiscoverLocalItem(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.description,
      this.isFavorite = false});
      void checkFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
}
}