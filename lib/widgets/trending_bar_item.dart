import 'package:Parava/screens/trending_item_detail_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/size_config.dart';

class TrendingLocalBar extends StatelessWidget {
  DocumentSnapshot _trendingReferance;
  TrendingLocalBar(this._trendingReferance);
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
                    Navigator.of(context).pushNamed(
                        TrendingDetailItem.routeName,
                        arguments: _trendingReferance);
                  },
                  splashColor: Colors.orangeAccent,
                  child: Hero(
                      tag: _trendingReferance['imageUrl'],
                      child: FadeInImage(
                        placeholder: AssetImage("assets/images/fest.png"),
                        image: NetworkImage(_trendingReferance['imageUrl']),
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
            _trendingReferance['title'],
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
