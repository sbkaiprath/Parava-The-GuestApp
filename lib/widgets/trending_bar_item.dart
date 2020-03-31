import 'package:Parava/screens/trending_item_detail_screen.dart';
import 'package:flutter/material.dart';

class TrendingLocalBar extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  TrendingLocalBar(this.id,this.imageUrl, this.title);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.18,
                width: 145,
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(TrendingDetailItem.routeName,arguments: id);
                  },
                  splashColor: Colors.orangeAccent,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height * 0.18,
                    width: 145,
                  ),
                ),
                decoration: BoxDecoration(color: Colors.black26),
              ),
            ),
            SizedBox(
              width: 8,
            )
          ],
        ),
        SizedBox(
          height: 4,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
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
