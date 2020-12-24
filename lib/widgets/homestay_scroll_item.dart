import 'package:Parava/screens/homestay_detail_screen.dart';
import 'package:flutter/material.dart';
import '../models/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomestayScroll extends StatelessWidget {
  final DocumentSnapshot _homeitem;
  HomestayScroll(this._homeitem);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(
                  Radius.circular(SizeConfig.blockSizeHorizontal * 6)),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(HomestayDetail.routeName,
                      arguments: _homeitem);
                },
                splashColor: Colors.orange,
                child: Container(
                  child: Image.network(
                    _homeitem['imageurl'],
                    fit: BoxFit.cover,
                  ),
                  height: SizeConfig.blockSizeVertical * 16,
                  width: SizeConfig.blockSizeHorizontal * 32,
                ),
              ),
            ),
            Text(
              _homeitem['name'],
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
              softWrap: true,
              overflow: TextOverflow.fade,
            )
          ],
        ),
        SizedBox(
          width: SizeConfig.blockSizeHorizontal * 5,
        )
      ],
    );
  }
}
