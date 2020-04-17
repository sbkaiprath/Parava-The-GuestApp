import 'package:Parava/widgets/favorite_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/size_config.dart';
import 'package:provider/provider.dart';
import '../providers/discover_local.dart';
import '../providers/discover_local_item.dart';

class DiscoverLocalScreen extends StatelessWidget {
  static const routeName = '/discover';
  @override
  Widget build(BuildContext context) {
     DocumentSnapshot discoverLocal = ModalRoute.of(
      context,
    ).settings.arguments;
    SizeConfig().init(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: SizeConfig.blockSizeVertical * 40,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    discoverLocal['title'],
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              background: Hero(
                tag: discoverLocal.documentID,
                child: Image.network(
                  discoverLocal['imageUrl'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),
            /* Text(
              discover.findByid(id).title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.blockSizeHorizontal * 5),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),*/
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
               discoverLocal['description'],
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              child: Row(
                children: <Widget>[
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(
                        right: SizeConfig.blockSizeHorizontal * 5),
                    child: Text(
                      "Add to Favorites",
                      style: TextStyle(
                          fontFamily: "OpenSans", color: Colors.black54),
                    ),
                  ),
                  FavoriteStatus(discoverLocal)
                ],
              ),
            ),
            SizedBox(
              height: 800,
            )
          ]))
        ],
      ),
    );
  }
}
