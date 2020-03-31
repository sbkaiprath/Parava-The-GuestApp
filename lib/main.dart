import 'package:Parava/screens/homestay_detail_screen.dart';

import './screens/items_search_screen.dart';
import './providers/homestay.dart';
import './providers/items_search.dart';
import './providers/discover_local.dart';
import './providers/trending_local.dart';
import './screens/trending_item_detail_screen.dart';
import './widgets/local_tabbar.dart';
import './providers/trending_local_item.dart';
import './screens/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: TrendingLocal()),
        ChangeNotifierProvider.value(value: DiscoverLocal()),
        ChangeNotifierProvider.value(value: TrendingLocalItem()),
        ChangeNotifierProvider.value(
          value: ItemsSearch(),
        ),
        ChangeNotifierProvider.value(value: HomeStay())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          LocalTabBar.routeName: (context) => LocalTabBar(),
          TrendingDetailItem.routeName: (context) => TrendingDetailItem(),
          ItemSearchScreen.routeName: (context) => ItemSearchScreen(),
          HomestayDetail.routeName: (context) => HomestayDetail()
        },
        theme: ThemeData(
            primaryColor: Colors.indigo,
            accentColor: Colors.amber,
            textTheme: TextTheme(
                caption: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "OpenSans",
                    fontSize: 17,
                    color: Colors.black54),
                bodyText1: TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 20,
                    color: Colors.white70),
                bodyText2: TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 15,
                    color: Colors.white70))),
      ),
    );
  }
}
