import './screens/homestay_services_book.dart';
import './providers/homestay_services.dart';
import './screens/homestay_detail_screen.dart';
import './screens/homestay_item_screen.dart';
import './screens/items_search_screen.dart';
import './providers/homestay.dart';
import './providers/items_search.dart';
import './screens/trending_item_detail_screen.dart';
import './widgets/local_tabbar.dart';

import './screens/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './helpers/custoum_page_route.dart';
import './screens/discover_local_detail_screen.dart';
import './screens/create_account_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ItemsSearch(),
        ),
        ChangeNotifierProvider.value(value: HomeStay()),
        ChangeNotifierProvider.value(
            value: HomestayService(
                id: null,
                title: null,
                description: null,
                amount: null,
                imageurl: null)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          LocalTabBar.routeName: (context) => LocalTabBar(),
          TrendingDetailItem.routeName: (context) => TrendingDetailItem(),
          ItemSearchScreen.routeName: (context) => ItemSearchScreen(),
          HomestayDetail.routeName: (context) => HomestayDetail(),
          HomestayItemScreen.routeName: (context) => HomestayItemScreen(),
          HomestayServiceBook.routeName: (context) => HomestayServiceBook(),
          DiscoverLocalScreen.routeName: (context) => DiscoverLocalScreen(),
          CreateAccount.routeName: (context) => CreateAccount()
        },
        theme: ThemeData(
            primaryColor: Colors.indigo,
            accentColor: Colors.amber,
            pageTransitionsTheme: PageTransitionsTheme(builders: {
              TargetPlatform.android: CustomPageTransitionBuilder(),
              TargetPlatform.iOS: CustomPageTransitionBuilder()
            }),
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
