import 'package:Parava/screens/homestay_services_book.dart';

import '../providers/homestay_services.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../providers/homestay.dart';

class ScreenArgumentsid {
  final String id;
  final String serviceId;
  final String imageUrl;
  final double amount;
  final String description;
  final String name;
  ScreenArgumentsid(this.id, this.serviceId, this.imageUrl, this.amount,
      this.description, this.name);
}

class HomestayItemScreen extends StatelessWidget {
  static const routeName = "/homestay-item";
  @override
  Widget build(BuildContext context) {
    final homeData = Provider.of<HomeStay>(context, listen: false);
    final serviceData = Provider.of<HomestayService>(context);
    final ScreenArgumentsid homeItem =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(homeData.findById(homeItem.id).name),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Card(
                elevation: 3,
                child: Image.network(
                  homeItem.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            homeItem.name,
            style: Theme.of(context).textTheme.caption,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "₹ ${homeItem.amount.toString()}",
            style: TextStyle(
                color: Colors.green, fontWeight: FontWeight.bold, fontSize: 17),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            homeItem.description,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    serviceData.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    serviceData.toggleFavorite(homeItem.serviceId);
                    print(serviceData.isFavorite);
                  }),
              Text(
                'Add to Favorites',
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: "OpenSans",
                ),
              ),
              Spacer(),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.all(12),
                color: Colors.green,
                elevation: 5,
                onPressed: () {
                  Navigator.of(context).pushNamed(HomestayServiceBook.routeName,
                      arguments:
                          ScreenArgumentsBook(homeItem.name, homeItem.amount, homeData.findById(homeItem.id).name));
                },
                child: Row(
                  children: <Widget>[
                    Icon(
                      MdiIcons.cart,
                      color: Colors.white,
                    ),
                    Text(
                      "Order",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 12,
              )
            ],
          )
        ],
      ),
    );
  }
}
