import 'package:flutter/foundation.dart';

class DiscoverLocalItem {
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
}

class DiscoverLocal with ChangeNotifier {
  List<DiscoverLocalItem> _items = [
    DiscoverLocalItem(
        id: "n1",
        title: "Kallumakaya",
        imageUrl:
            "https://www.nawrasseafood.com/wp-content/uploads/2018/01/kallummukkaya-porichathu.jpg",
        description: ""),
    DiscoverLocalItem(
        id: "n2",
        title: "Kallumakaya",
        imageUrl:
            "https://www.nawrasseafood.com/wp-content/uploads/2018/01/kallummukkaya-porichathu.jpg",
        description: ""),
    DiscoverLocalItem(
        id: "n3",
        title: "Kallumakaya",
        imageUrl:
            "https://www.nawrasseafood.com/wp-content/uploads/2018/01/kallummukkaya-porichathu.jpg",
        description: ""),
    DiscoverLocalItem(
        id: "n4",
        title: "Kallumakaya",
        imageUrl:
            "https://www.nawrasseafood.com/wp-content/uploads/2018/01/kallummukkaya-porichathu.jpg",
        description: ""),
    DiscoverLocalItem(
        id: "n5",
        title: "Kallumakaya",
        imageUrl:
            "https://www.nawrasseafood.com/wp-content/uploads/2018/01/kallummukkaya-porichathu.jpg",
        description: ""),
    DiscoverLocalItem(
        id: "n6",
        title: "Kallumakaya",
        imageUrl:
            "https://www.nawrasseafood.com/wp-content/uploads/2018/01/kallummukkaya-porichathu.jpg",
        description: "")
  ];
  List<DiscoverLocalItem> get items {
    return [..._items];
  }

  void addDiscover() {
    //...
    notifyListeners();
  }
}
