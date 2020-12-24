import 'package:flutter/material.dart';
import '../widgets/trending_bar_item.dart';
import '../widgets/discover_bar_item.dart';
import '../models/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Row(
              children: <Widget>[
                Image.asset("assets/images/parava.png", height: 35, width: 35),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    "Parava",
                    style: TextStyle(
                      color: Colors.black87,
                      fontFamily: "Rosheila",
                      fontSize: 25,
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/');
                  },
                  splashColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/icons8-discount-100.png",
                        height: 35,
                        width: 35,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Offers",
                        style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.grey,
              indent: 10,
              endIndent: 10,
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 1,
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 3),
              child: Text(
                "Trending Local",
                style: TextStyle(
                    color: Colors.black54,
                    fontFamily: "Ubuntu",
                    fontSize: SizeConfig.blockSizeHorizontal * 6,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 1,
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 3),
              child: Text('Explore the ongoing Season varieties.',
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 4,
                      color: Colors.grey)),
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 1,
            ),
            Container(
              height: SizeConfig.blockSizeVertical * 23,
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal * 1,
                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('trendingLocal')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Expanded(
                          child: ListView.builder(
                            itemBuilder: (ctx, index) =>
                                TrendingLocalBar(snapshot.data.docs[index]),
                            itemCount: snapshot.data.docs.length,
                            scrollDirection: Axis.horizontal,
                          ),
                        );
                      }),
                ],
              ),
            ),
            Divider(color: Colors.grey),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 3),
              child: Text(
                "Discover Local",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: SizeConfig.blockSizeHorizontal * 6,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 1,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                  'Checkout out offbeat things to do and get an\n authenthic experiment.',
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 4,
                      color: Colors.grey)),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 3,
            ),
            Row(
              children: <Widget>[
                Container(
                  height: SizeConfig.blockSizeVertical * 34,
                  width: SizeConfig.screenWidth,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('discoverLocal')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return GridView.builder(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            itemCount: snapshot.data.docs.length,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                            ),
                            itemBuilder: (ctx, index) =>
                                DiscoverLocals(snapshot.data.docs[index]));
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
