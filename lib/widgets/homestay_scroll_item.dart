import 'package:Parava/screens/homestay_detail_screen.dart';
import 'package:flutter/material.dart';
import '../providers/homestay.dart';

class HomestayScroll extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final Currently currently;
  HomestayScroll(this.id, this.imageUrl, this.title, this.currently);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(HomestayDetail.routeName,
                      arguments: ScreenArguments(id, currently));
                },
                splashColor: Colors.orange,
                child: Container(
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                  height: MediaQuery.of(context).size.height * 0.18,
                  width: 145,
                ),
              ),
            ),
            Text(
              title,
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
          width: 8,
        )
      ],
    );
  }
}
