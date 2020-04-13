import 'package:Parava/screens/discover_local_detail_screen.dart';
import 'package:flutter/material.dart';
import '../models/size_config.dart';

class DiscoverLocals extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  DiscoverLocals(this.id, this.imageUrl, this.title);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ClipRRect(
      borderRadius: BorderRadius.all(
          Radius.circular(SizeConfig.blockSizeHorizontal * 14)),
      child: Card(
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed(DiscoverLocalScreen.routeName, arguments: id);
          },
          splashColor: Colors.lightBlue,
          child: Hero(
            tag: id,
            child: Image.network(
              imageUrl,
              fit: BoxFit.fill,
            ),
          ),
        ),
        elevation: 1,
      ),
    )

        //Text(title)
        ;
  }
}
