import 'package:flutter/foundation.dart';
import '../providers/homestay.dart';

class ItemsSearchItem {
  final String id;
  final String imageUrl;
  final String title;
  final Object detail;
  ItemsSearchItem(
      {@required this.id,
      @required this.detail,
      @required this.imageUrl,
      @required this.title});
}

class ItemsSearch with ChangeNotifier {
  List<ItemsSearchItem> _items = [
    ItemsSearchItem(
        id: "b1",
        detail: HomeStay(),
        imageUrl:
            "https://images-na.ssl-images-amazon.com/images/I/813tMa1%2B4cL._SX466_.jpg",
        title: "Stay"),
  ];
  List<ItemsSearchItem> get items {
    return [..._items];
  }

  ItemsSearchItem findItemTitle(String title) {
    return _items.firstWhere((element) => element.title == title);
  }

  ItemsSearchItem findItem(String id) {
    return _items.firstWhere((item) => item.id == id);
  }
}
