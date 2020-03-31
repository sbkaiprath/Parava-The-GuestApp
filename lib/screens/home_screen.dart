import '../providers/discover_local.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/trending_local.dart';
import '../widgets/trending_bar_item.dart';
import '../widgets/discover_bar_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final trendItem = Provider.of<TrendingLocal>(context);
    final discoverItem = Provider.of<DiscoverLocal>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
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
              onTap: () {},
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
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18),
                  ),
                  SizedBox(
                    width: 6,
                  )
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Trending Local",
                style: TextStyle(
                    color: Colors.black54,
                    fontFamily: "OpenSans",
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                  'Explore the ongoing Season varieties.',
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontSize: 15,
                      color: Colors.grey)),
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.21,
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (ctx, index) => TrendingLocalBar(
                          trendItem.items[index].id,
                          trendItem.items[index].imageUrl,
                          trendItem.items[index].title),
                      itemCount: trendItem.items.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Discover Local",
                style: TextStyle(
                    color: Colors.black54,
                    fontFamily: "OpenSans",
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                  'Checkout out offbeat things to do and get an\n authenthic experiment.',
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontSize: 15,
                      color: Colors.grey)),
            ),
            SizedBox(
              height: 6,
            ),
            Row(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.44,
                  width: MediaQuery.of(context).size.width * 1,
                  child: GridView.builder(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      itemCount: discoverItem.items.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemBuilder: (ctx, index) => DiscoverLocals(
                          discoverItem.items[index].imageUrl,
                          discoverItem.items[index].title)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
