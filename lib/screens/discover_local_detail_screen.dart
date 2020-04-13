import 'package:flutter/material.dart';
import '../models/size_config.dart';
import 'package:provider/provider.dart';
import '../providers/discover_local.dart';
import '../providers/discover_local_item.dart';

class DiscoverLocalScreen extends StatelessWidget {
  static const routeName = '/discover';
  @override
  Widget build(BuildContext context) {
    final discover = Provider.of<DiscoverLocal>(context, listen: false);
    final id = ModalRoute.of(
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
                    discover.findByid(id).title,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              background: Hero(
                tag: id,
                child: Image.network(
                  discover.findByid(id).imageUrl,
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
                discover.findByid(id).description,
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
                  Consumer<DiscoverLocalItem>(
                    builder: (ctx, value, child) => IconButton(
                        iconSize: SizeConfig.blockSizeHorizontal * 7,
                        icon: Icon(
                          value.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          value.checkFavorite();
                          print(value.isFavorite);
                        }),
                  )
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
