import 'package:flutter/material.dart';

class DiscoverLocals extends StatelessWidget {
  final String imageUrl;
  final String title;
  DiscoverLocals(this.imageUrl, this.title);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(45)),
      child: Card(
        child: InkWell(
          onTap: () {},
          splashColor: Colors.lightBlue,
          child: Image.network(
            imageUrl,
            fit: BoxFit.fill,
          ),
        ),
        elevation: 3,
      ),
    )

        //Text(title)
        ;
  }
}
