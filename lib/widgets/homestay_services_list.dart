import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/homestay.dart';

class HomestayServicesList extends StatelessWidget {
  final String id;
  HomestayServicesList(this.id);
  @override
  Widget build(BuildContext context) {
    final homeData = Provider.of<HomeStay>(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.32,
      width: double.infinity,
      child: ListView.builder(
        padding: EdgeInsets.all(10),
        itemBuilder: (ctx, i) => Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Container(
                height: 100,
                width: 100,
                child: Image.network(
                  homeData.findById(id).service[i].imageurl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              homeData.findById(id).service[i].title,
              style: TextStyle(
                  color: Colors.black, fontSize: 18, fontFamily: "OpenSans"),
            ),
            trailing: Text(
              "₹ ${homeData.findById(id).service[i].amount.toString()}",
              style: TextStyle(
                  color: Colors.green, fontSize: 18, fontFamily: "OpenSans"),
            ),
            onTap: () {},
          ),
        ),
        itemCount: homeData.findById(id).service.length,
      ),
    );
  }
}
