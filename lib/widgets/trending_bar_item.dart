import 'package:Parava/screens/trending_item_detail_screen.dart';
import 'package:flutter/material.dart';
import '../models/size_config.dart';

class TrendingLocalBar extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  TrendingLocalBar(this.id, this.imageUrl, this.title);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              child: Container(
                height: SizeConfig.blockSizeVertical * 18,
                width: SizeConfig.blockSizeHorizontal * 35,
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(TrendingDetailItem.routeName, arguments: id);
                  },
                  splashColor: Colors.orangeAccent,
                  child: Hero(
                      tag: id,
                      child: FadeInImage(
                        placeholder: AssetImage("assets/images/fest.png"),
                        image: NetworkImage(imageUrl),
                        height: SizeConfig.blockSizeVertical * 18,
                        width: SizeConfig.blockSizeHorizontal * 35,
                        fit: BoxFit.fill,
                      ) /*Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      height: SizeConfig.blockSizeVertical * 18,
                      width: SizeConfig.blockSizeHorizontal * 35,
                    ),*/
                      ),
                ),
                decoration: BoxDecoration(color: Colors.black26),
              ),
            ),
            SizedBox(
              width: SizeConfig.blockSizeHorizontal * 4,
            )
          ],
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 1.5,
        ),
        Flexible(
          fit: FlexFit.tight,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
            softWrap: true,
            overflow: TextOverflow.fade,
          ),
        )
      ],
    );
  }
}
