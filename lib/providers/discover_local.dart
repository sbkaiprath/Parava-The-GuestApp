import 'package:flutter/foundation.dart';
import './discover_local_item.dart';

class DiscoverLocal with ChangeNotifier {
  List<DiscoverLocalItem> _items = [
    DiscoverLocalItem(
        id: "n1",
        title: "Kallumakaya",
        imageUrl:
            "https://www.nawrasseafood.com/wp-content/uploads/2018/01/kallummukkaya-porichathu.jpg",
        description:
            "Kallumakkaya Nirachathu or Stuffed Mussels are another feather in the cap of Malabar cuisine. The fragrance of delicately spiced mussels along with the fresh taste of the seafood makes for an exquisite combination. Imported directly from the households of North Kerala where it was perfected, below lies the recipe for this culinary masterpiece."),
    DiscoverLocalItem(
        id: "n2",
        title: "Kallumakaya",
        imageUrl:
            "https://www.nawrasseafood.com/wp-content/uploads/2018/01/kallummukkaya-porichathu.jpg",
        description:
            "Kallumakkaya Nirachathu or Stuffed Mussels are another feather in the cap of Malabar cuisine. The fragrance of delicately spiced mussels along with the fresh taste of the seafood makes for an exquisite combination. Imported directly from the households of North Kerala where it was perfected, below lies the recipe for this culinary masterpiece."),
    DiscoverLocalItem(
        id: "n3",
        title: "Kallumakaya",
        imageUrl:
            "https://www.nawrasseafood.com/wp-content/uploads/2018/01/kallummukkaya-porichathu.jpg",
        description:
            "Kallumakkaya Nirachathu or Stuffed Mussels are another feather in the cap of Malabar cuisine. The fragrance of delicately spiced mussels along with the fresh taste of the seafood makes for an exquisite combination. Imported directly from the households of North Kerala where it was perfected, below lies the recipe for this culinary masterpiece."),
    DiscoverLocalItem(
        id: "n4",
        title: "Kallumakaya",
        imageUrl:
            "https://www.nawrasseafood.com/wp-content/uploads/2018/01/kallummukkaya-porichathu.jpg",
        description:
            "Kallumakkaya Nirachathu or Stuffed Mussels are another feather in the cap of Malabar cuisine. The fragrance of delicately spiced mussels along with the fresh taste of the seafood makes for an exquisite combination. Imported directly from the households of North Kerala where it was perfected, below lies the recipe for this culinary masterpiece."),
    DiscoverLocalItem(
        id: "n5",
        title: "Kallumakaya",
        imageUrl:
            "https://www.nawrasseafood.com/wp-content/uploads/2018/01/kallummukkaya-porichathu.jpg",
        description:
            "Kallumakkaya Nirachathu or Stuffed Mussels are another feather in the cap of Malabar cuisine. The fragrance of delicately spiced mussels along with the fresh taste of the seafood makes for an exquisite combination. Imported directly from the households of North Kerala where it was perfected, below lies the recipe for this culinary masterpiece."),
    DiscoverLocalItem(
        id: "n6",
        title: "Kallumakaya",
        imageUrl:
            "https://www.nawrasseafood.com/wp-content/uploads/2018/01/kallummukkaya-porichathu.jpg",
        description:
            "Kallumakkaya Nirachathu or Stuffed Mussels are another feather in the cap of Malabar cuisine. The fragrance of delicately spiced mussels along with the fresh taste of the seafood makes for an exquisite combination. Imported directly from the households of North Kerala where it was perfected, below lies the recipe for this culinary masterpiece.")
  ];
  List<DiscoverLocalItem> get items {
    return [..._items];
  }

  DiscoverLocalItem findByid(String id) {
   return _items.firstWhere((element) => element.id==id);
  }
  
}
