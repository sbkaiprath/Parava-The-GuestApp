import 'package:Parava/widgets/favorite_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import '../models/size_config.dart';

class TrendingDetailItem extends StatelessWidget {
  static const routeName = '/trending-item';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    DocumentSnapshot trendingSnapshot =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trending",
          style:
              TextStyle(fontFamily: "Quicksand", fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              height: SizeConfig.blockSizeVertical * 30,
              width: SizeConfig.screenWidth,
              child: Card(
                elevation: 5,
                child: Hero(
                  tag: trendingSnapshot['imageUrl'],
                  child: Image.network(
                    trendingSnapshot['imageUrl'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(trendingSnapshot['title'],
                style: TextStyle(
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: SizeConfig.blockSizeHorizontal * 6)),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 1,
            ),
            Text(
              "Place : ${trendingSnapshot['place']}",
              style: Theme.of(context).textTheme.caption,
            ),
            SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    trendingSnapshot['description'],
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(
                    height:30
                  ),
                  Container(
           alignment: Alignment.center,
          decoration: BoxDecoration(
    border: Border.all(
      color: Colors.indigo[500],
     
    ),
    borderRadius: BorderRadius.all(Radius.circular(25)),
  
  ),

                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: <Widget>[
               
                        Padding(
                          padding: EdgeInsets.only(
                              right: SizeConfig.blockSizeHorizontal * 5),
                          child: Text(
                            "Add to Favorites",
                            style: TextStyle(
                                fontFamily: "OpenSans", color: Colors.black54),
                          ),
                        ),
                        FavoriteStatus(trendingSnapshot)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
