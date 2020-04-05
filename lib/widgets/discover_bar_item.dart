import 'package:flutter/material.dart';
import '../models/size_config.dart';
class DiscoverLocals extends StatelessWidget {
  final String imageUrl;
  final String title;
  DiscoverLocals(this.imageUrl, this.title);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(SizeConfig.blockSizeHorizontal*14)),
      child: Card(
        child: InkWell(
          onTap: () {},
          splashColor: Colors.lightBlue,
          child: Image.network(
            imageUrl,
            fit: BoxFit.fill,
          ),
        ),
        elevation: 1,
      ),
    )

        //Text(title)
        ;
  }
}
