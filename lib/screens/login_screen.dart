import 'package:Parava/my_flutter_app_icons.dart';

import '../widgets/local_tabbar.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 1,
                width: double.infinity,
                child: Image.network(
                  "https://cdn.pixabay.com/photo/2016/09/02/14/25/kerala-1639325_960_720.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 1,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.lightBlue.withOpacity(0.1),
              Colors.lightBlue
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 85),
                child: Text(
                  "Hello there,\nSwagatham.!",
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w400,
                      color: Colors.white70,
                      fontFamily: "Quicksand"),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80, right: 60),
                child: RawMaterialButton(
                  elevation: 5,
                  splashColor: Colors.lightBlue,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 25,
                      ),
                      Icon(
                        MyFlutterApp.google,
                        size: 25,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("Continue with Google",
                            style: Theme.of(context).textTheme.caption),
                      )
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(LocalTabBar.routeName);
                  },
                  fillColor: Colors.white70,
                  shape: StadiumBorder(side: BorderSide(color: Colors.white70)),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80, right: 60),
                child: RawMaterialButton(
                  elevation: 5,
                  splashColor: Colors.white70,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 25,
                      ),
                      Icon(
                        Icons.supervised_user_circle,
                        size: 30,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("Create New Account",
                            style: Theme.of(context).textTheme.caption),
                      )
                    ],
                  ),
                  onPressed: () {},
                  shape: StadiumBorder(side: BorderSide(color: Colors.white70)),
                ),
              ),
              SizedBox(height: 5,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Checkbox(
                      value: checkBoxValue,
                      onChanged: (bool value) {
                        print(value);
                        setState(() {
                          checkBoxValue = value;
                        });
                      }),
                  Text("Receive Promotional mails from \n from Kerala Tourism.",
                      style: Theme.of(context).textTheme.bodyText2),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "More Options",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "By tapping Continue a User linked agreements\nand must click 'Agree and Continue' \nbox with further makes it clear to the user that an agreement has taken place.",
                      style: Theme.of(context).textTheme.bodyText2,
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
