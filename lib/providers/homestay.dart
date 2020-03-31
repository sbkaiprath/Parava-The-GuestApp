import 'package:flutter/foundation.dart';

enum Currently { Open, Closed }

class HomeStayItem {
  final String id;
  final String name;
  final String address;
  final String imageUrl;
  final Currently currently;
  final double susIndex;
  final double disabIndex;
  final double reviewIndex;
  bool disableFriendly;
  bool ecoFriendly;
  bool childFriendly;
  HomeStayItem(
      {@required this.id,
      @required this.name,
      @required this.address,
      @required this.imageUrl,
      @required this.currently,
      this.childFriendly = true,
      this.disableFriendly = true,
      this.ecoFriendly = true,
      @required this.disabIndex,
      @required this.reviewIndex,
      @required this.susIndex});
}

class HomeStay with ChangeNotifier {
  List<HomeStayItem> _items = [
    HomeStayItem(
        id: "k1",
        name: "Shetty Homestays",
        address: " Mysore road,Mysore",
        currently: Currently.Open,
        disabIndex: 3.8,
        reviewIndex: 4,
        susIndex: 4.1,
        imageUrl:
            "https://img.traveltriangle.com/blog/wp-content/uploads/2018/04/Gitanjali-Homestay-mysore-kb6592.jpg",
        childFriendly: true,
        disableFriendly: false,
        ecoFriendly: true),
    HomeStayItem(
        id: "k2",
        name: "New Villa Residency",
        address: "Munnar, Idukki ",
        imageUrl:
            "https://akm-img-a-in.tosshub.com/indiatoday/images/story/201610/story_aanvilasam_647_100516054920.jpg",
        currently: Currently.Open,
        disabIndex: 3.2,
        reviewIndex: 3.5,
        susIndex: 3.8,
        childFriendly: false,
        disableFriendly: true,
        ecoFriendly: false),
    HomeStayItem(
        id: "k3",
        name: "WhiteField Resorts",
        address: "SulthanBatheery, Wayanad",
        imageUrl:
            "https://www.kudajadridrizzle.com/images/wayanad-homestays-kudajadri-drizzle-interior.jpg",
        currently: Currently.Closed,
        disabIndex: 4.3,
        reviewIndex: 4.1,
        susIndex: 4.5,
        childFriendly: true,
        disableFriendly: false,
        ecoFriendly: false),
    HomeStayItem(
        id: "k4",
        name: "Venu's Homestays",
        address: "East Fort, Thrissur",
        imageUrl:
            "https://www.sakleshpurstays.in/wp-content/uploads/2019/01/Bisle-Nature-Trail-Homestay-1-500x300.jpg",
        currently: Currently.Closed,
        disabIndex: 4.4,
        reviewIndex: 3.8,
        susIndex: 3.2,
        childFriendly: true,
        disableFriendly: true,
        ecoFriendly: false),
    HomeStayItem(
        id: "k5",
        name: "Korans Homestays",
        address: "WestFort Road, Thrissur",
        imageUrl:
            "http://newsmobile.in/wp-content/uploads/2018/01/homestays-himalayan-theluxecafe.jpg",
        currently: Currently.Open,
        disabIndex: 3.2,
        reviewIndex: 3.6,
        susIndex: 3.8,
        childFriendly: true,
        disableFriendly: false,
        ecoFriendly: true)
  ];
  List<HomeStayItem> get items {
    return [..._items];
  }

  HomeStayItem findById(String id) {
    return _items.firstWhere((element) => element.id == id);
    //.....
    // notifyListeners();
  }
}
