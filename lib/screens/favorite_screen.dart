import 'package:flutter/material.dart';
import '../models/size_config.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    SizeConfig().init(context);
    return Column(
      children: <Widget>[
        SizedBox(
          height: mediaQuery.padding.top,
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        SizeConfig.blockSizeHorizontal * 7),
                    border: Border.all(
                      color: Colors.grey,
                    )),
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Row(
                    children: <Widget>[
                      Text("Select",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.blockSizeHorizontal * 5,
                          )),
                      Icon(
                        Icons.arrow_drop_down,
                        size: SizeConfig.blockSizeHorizontal * 8,
                      )
                    ],
                  ),
                  onTap: () {},
                ),
              ),
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(SizeConfig.blockSizeHorizontal * 7),
              border: Border.all(
                color: Colors.grey,
              )),
          padding: EdgeInsets.all(8),
          child: GestureDetector(
            child: Row(
              children: <Widget>[
                Text("Select",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: SizeConfig.blockSizeHorizontal * 5,
                    )),
                Icon(
                  Icons.arrow_drop_down,
                  size: SizeConfig.blockSizeHorizontal * 8,
                )
              ],
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
