import '../providers/homestay.dart';
import '../widgets/homestay_scroll_item.dart';

import '../providers/items_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemSearchScreen extends StatelessWidget {
  static const routeName = '/item-search';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final itemData = Provider.of<ItemsSearch>(context, listen: false);
    final stayData = Provider.of<HomeStay>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
          title: Text(
        itemData.findItem(id).title,
        style: TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.bold),
      )),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: double.infinity,
                // padding: EdgeInsets.all(10),
                child: Image.network(
                  itemData.findItem(id).imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Spacer(),
                    Text(
                      itemData.findItem(id).title,
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          color: Colors.white70,
                          fontSize: 67),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            color: Colors.grey,
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
              child: ListView.builder(
            padding: EdgeInsets.all(8),
            itemBuilder: (ctx, index) => HomestayScroll(
                stayData.items[index].id,
                stayData.items[index].imageUrl,
                stayData.items[index].name,
                stayData.items[index].currently),
            itemCount: stayData.items.length,
            scrollDirection: Axis.horizontal,
          ))
        ],
      ),
    );
  }
}
