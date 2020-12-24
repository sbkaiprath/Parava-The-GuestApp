import 'package:Parava/models/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FavoriteStatus extends StatefulWidget {
  DocumentSnapshot snapshot;
  FavoriteStatus(this.snapshot);

  @override
  _FavoriteStatusState createState() => _FavoriteStatusState();
}

class _FavoriteStatusState extends State<FavoriteStatus> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return IconButton(
        iconSize: SizeConfig.blockSizeHorizontal * 7,
        icon: Icon(
          widget.snapshot['isFavorite']
              ? Icons.favorite
              : Icons.favorite_border,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () {
          FirebaseFirestore.instance.runTransaction((transaction) async {
            DocumentSnapshot freshSnap =
                await transaction.get(widget.snapshot.reference);
            await transaction.update(
                freshSnap.reference, {'isFavorite': !freshSnap['isFavorite']});
            setState(() {
              widget.snapshot = freshSnap;
            });

            //print(freshSnap['isFavorite']);
            // print(widget.snapshot['isFavorite']);
          });
        });
  }
}
