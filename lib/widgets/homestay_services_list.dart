import 'package:Parava/screens/homestay_item_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../providers/homestay.dart';
import '../models/size_config.dart';

class HomestayServicesList extends StatelessWidget {
  final DocumentSnapshot _homedata;
  HomestayServicesList(this._homedata);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    //final homeData = Provider.of<HomeStay>(context);
    return Container(
        height: MediaQuery.of(context).size.width > 360
            ? MediaQuery.of(context).size.height * 0.32
            : MediaQuery.of(context).size.height * 0.30,
        width: double.infinity,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('services')
              .where('documentId', isEqualTo: _homedata['services'])
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              padding: EdgeInsets.all(10),
              itemBuilder: (ctx, i) {
                final DocumentSnapshot item = snapshot.data.docs[i];
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.all(
                          Radius.circular(SizeConfig.blockSizeHorizontal * 3)),
                      child: Container(
                        height: SizeConfig.blockSizeVertical * 10,
                        width: SizeConfig.blockSizeVertical * 12,
                        child: Image.network(
                          item['imageUrl'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      item['title'],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.blockSizeHorizontal * 4.5,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      "₹ ${item['amount'].toString()}",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: SizeConfig.blockSizeHorizontal * 4.5,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      /* Navigator.of(context).pushNamed(
                        HomestayItemScreen.routeName,
                        arguments: ScreenArgumentsid(
                            id,
                            homeData.findById(id).service[i].id,
                            homeData.findById(id).service[i].imageurl,
                            homeData.findById(id).service[i].amount,
                            homeData.findById(id).service[i].description,
                            homeData.findById(id).service[i].title));*/
                    },
                  ),
                );
              },
              itemCount: snapshot.data.docs.length,
            );
          },
        ));
  }
}
