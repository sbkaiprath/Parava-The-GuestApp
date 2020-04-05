import 'package:Parava/screens/homestay_detail_screen.dart';
import 'package:flutter/material.dart';
import '../providers/homestay.dart';
import '../models/size_config.dart';
class HomestayScroll extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final Currently currently;
  HomestayScroll(this.id, this.imageUrl, this.title, this.currently);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(SizeConfig.blockSizeHorizontal*5)),
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
                  height: SizeConfig.blockSizeVertical*18,
                  width: SizeConfig.blockSizeHorizontal*36,
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
