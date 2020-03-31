import '../providers/trending_local.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/trending_local_item.dart';

class TrendingDetailItem extends StatelessWidget {
  static const routeName = '/trending-item';
  @override
  Widget build(BuildContext context) {
    final trendingId = ModalRoute.of(context).settings.arguments;
    final trend = Provider.of<TrendingLocal>(context, listen: false);
    final trends = Provider.of<TrendingLocalItem>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trending",
          style:
              TextStyle(fontFamily: "Quicksand", fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 1,
            child: Card(
              elevation: 5,
              child: Image.network(
                trend.findProduct(trendingId).imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(trend.findProduct(trendingId).title,
              style: TextStyle(
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 23)),
          SizedBox(
            height: 5,
          ),
          Text(
            "Place : ${trend.findProduct(trendingId).place}",
            style: Theme.of(context).textTheme.caption,
          ),
          SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Text(
                  trend.findProduct(trendingId).description,
                  style: TextStyle(color: Colors.black54),
                ),
                Row(
                  children: <Widget>[
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Text(
                        "Add to Favorites",
                        style: TextStyle(
                            fontFamily: "OpenSans", color: Colors.black54),
                      ),
                    ),
                    Consumer<TrendingLocalItem>(
                      builder: (ctx, value, child) => IconButton(
                          iconSize: 30,
                          icon: Icon(
                            trends.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Theme.of(context).primaryColor,
                          ),
                          onPressed: () {
                            trends.checkFavorite();
                            print(trends.isFavorite);
                          }),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
