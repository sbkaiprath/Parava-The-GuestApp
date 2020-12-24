import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/homestay_scroll_item.dart';
import '../models/size_config.dart';
import '../providers/items_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemSearchScreen extends StatelessWidget {
  static const routeName = '/item-search';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final id = ModalRoute.of(context).settings.arguments;
    final itemData = Provider.of<ItemsSearch>(context, listen: false);
    final appBar = AppBar(
        title: Text(
      itemData.findItem(id).title,
      style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.bold),
    ));
    return Scaffold(
      appBar: appBar,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: SizeConfig.blockSizeVertical * 60,
                width: SizeConfig.screenWidth,
                // padding: EdgeInsets.all(10),
                child: Image.network(
                  itemData.findItem(id).imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: SizeConfig.blockSizeVertical * 60,
                width: SizeConfig.screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Spacer(),
                    Text(
                      itemData.findItem(id).title,
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          color: Colors.white70,
                          fontSize: SizeConfig.blockSizeHorizontal * 16),
                    ),
                  ],
                ),
              )
            ],
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal * 1,
          ),
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('stay').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                padding: EdgeInsets.all(8),
                itemBuilder: (ctx, index) => HomestayScroll(
                  snapshot.data.docs[index],
                ),
                itemCount: snapshot.data.docs.length,
                scrollDirection: Axis.horizontal,
              );
            },
          ))
        ],
      ),
    );
  }
}
