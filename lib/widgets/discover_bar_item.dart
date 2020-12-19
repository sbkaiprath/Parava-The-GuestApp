import 'package:Parava/screens/discover_local_detail_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/size_config.dart';

class DiscoverLocals extends StatelessWidget {
  DocumentSnapshot discoverLocal;
  DiscoverLocals(this.discoverLocal);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ClipRRect(
     borderRadius: BorderRadius.all(
    Radius.circular(SizeConfig.blockSizeHorizontal*5)),
      child: Card(
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed(DiscoverLocalScreen.routeName, arguments: discoverLocal);
          },
          splashColor: Colors.lightBlue,
          child: Hero(
            tag: discoverLocal.documentID,
            child: Image.network(
              discoverLocal['imageUrl'],
              fit: BoxFit.cover,
              
            ),
          ),
        ),
        elevation:1,
      ),
    )

        //Text(title)
        ;
  }
}
