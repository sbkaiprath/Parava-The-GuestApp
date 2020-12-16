import '../services/auth.dart';
import 'package:flutter/material.dart';
import '../screens/login_screen.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size.height * 1;
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageUrl != null
                  ? CircleAvatar(
                      radius: mediaQuery * 0.13,
                      backgroundColor: Colors.indigo,
                      child: Container(
                        alignment: Alignment.center,
                        width: mediaQuery * 0.25,
                        height: mediaQuery * 0.25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(imageUrl), fit: BoxFit.cover),
                        ),
                      ),
                    )
                  : CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey[300],
                      child: Text(
                        name ?? 'X',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: mediaQuery * 0.02),
                    alignment: Alignment.center,
                    width: 230,
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                          text: name ?? 'Anirudh',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: mediaQuery * 0.04)),
                    ),
                  ),
                  SizedBox(height: mediaQuery * 0.01),
                  Text(email ?? 'email',
                      style: TextStyle(color: Colors.green[400], fontSize: 13)),
                  SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        RaisedButton(
          onPressed: () {
            signOutGoogle();
            Navigator.of(context).pushReplacementNamed('/');
          },
          color: Colors.green,
          child: Text(
            "Logout",
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(height: 20),
        Divider(
          height: 5,
          thickness: 0,
          color: Colors.white,
          indent: 15,
          endIndent: 15,
        ),
        InkWell(
          onTap: () {},
          child: Card(
            margin: EdgeInsets.all(0),
            color: Theme.of(context).primaryColor,
            elevation: 0,
            child: ListTile(
              leading: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: null),
              title: Text(
                'My Bookings',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Divider(
          height: 0,
          thickness: 0.5,
          color: Colors.white,
          indent: 15,
          endIndent: 15,
        ),
      ],
    );
  }
}
