import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../screens/favorite_screen.dart';
import '../screens/home_screen.dart';
import '../screens/search_screen.dart';
import '../screens/user_screen.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class ScreenNow {
  //final FirebaseUser _user;
  ScreenNow(/*this._user*/);
}

class LocalTabBar extends StatefulWidget {
  static const routeName = "/local-tab";
  @override
  _LocalTabBarState createState() => _LocalTabBarState();
}

class _LocalTabBarState extends State<LocalTabBar> {
  int _selectedIndex = 0;

  List<Widget> _page;
  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void didChangeDependencies() {
    final ScreenNow argz = ModalRoute.of(context).settings.arguments;
    _page = [
      HomeScreen(),
      SearchScreen(),
      FavoriteScreen(),
      UserScreen(/*argz._user*/)
    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
      drawer: Drawer(),
      body: _page[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 0 ? Icons.home : MdiIcons.homeOutline,
                color: Colors.lightBlue,
              ),
              title: Text(
                "Home",
                style:
                    TextStyle(color: Colors.lightBlue, fontFamily: "OpenSans"),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 1 ? MdiIcons.selectSearch : Icons.search,
                color: Colors.lightBlue,
              ),
              title: Text(
                "Search",
                style:
                    TextStyle(color: Colors.lightBlue, fontFamily: "OpenSans"),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 2 ? Icons.favorite : Icons.favorite_border,
                color: Colors.lightBlue,
              ),
              title: Text(
                "Favorite",
                style:
                    TextStyle(color: Colors.lightBlue, fontFamily: "OpenSans"),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 3 ? Icons.person : Icons.person_outline,
                color: Colors.lightBlue,
              ),
              title: Text(
                "Profile",
                style:
                    TextStyle(color: Colors.lightBlue, fontFamily: "OpenSans"),
              ))
        ],
        onTap: _selectPage,
      ),
    );
  }
}
