import 'package:Parava/my_flutter_app_icons.dart';
import 'package:Parava/screens/create_account_screen.dart';
import '../models/size_config.dart';
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
    SizeConfig().init(context);
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: (mediaQuery.size.height) * 1,
                  width: SizeConfig.screenWidth,
                  child: Image.network(
                    "https://cdn.pixabay.com/photo/2016/09/02/14/25/kerala-1639325_960_720.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Container(
              height: (mediaQuery.size.height) * 1,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.lightBlue.withOpacity(0.1),
                Colors.lightBlue
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            ),
            SingleChildScrollView(
              child: Container(
                height: (mediaQuery.size.height) * 1,
                width: SizeConfig.screenWidth,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 32,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal * 22),
                          child: Text(
                            "Hello there,\nSwagatham.!",
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 11,
                                fontWeight: FontWeight.w400,
                                color: Colors.white70,
                                fontFamily: "Quicksand"),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 5,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal * 20,
                              right: SizeConfig.blockSizeHorizontal * 16),
                          child: RawMaterialButton(
                            elevation: 5,
                            splashColor: Colors.lightBlue,
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width: SizeConfig.blockSizeHorizontal * 7,
                                ),
                                Icon(
                                  MyFlutterApp.google,
                                  size: SizeConfig.blockSizeHorizontal * 6,
                                ),
                                SizedBox(
                                  width: SizeConfig.blockSizeHorizontal * 1,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(
                                      SizeConfig.blockSizeHorizontal * 3),
                                  child: Text("Continue with Google",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "OpenSans",
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal *
                                                  4.5,
                                          color: Colors.black54)),
                                )
                              ],
                            ),
                            onPressed: () => Navigator.of(context)
                                .pushReplacementNamed(LocalTabBar.routeName),
                            fillColor: Colors.white70,
                            shape: StadiumBorder(
                                side: BorderSide(color: Colors.white70)),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 2,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal * 20,
                              right: SizeConfig.blockSizeHorizontal * 16),
                          child: RawMaterialButton(
                            elevation: 5,
                            splashColor: Colors.white70,
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width: SizeConfig.blockSizeHorizontal * 7,
                                ),
                                Icon(
                                  Icons.supervised_user_circle,
                                  size: SizeConfig.blockSizeHorizontal * 6,
                                ),
                                SizedBox(
                                  width: SizeConfig.blockSizeHorizontal * 1,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(
                                      SizeConfig.blockSizeHorizontal * 3),
                                  child: Text("Create New Account",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "OpenSans",
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal *
                                                  4.5,
                                          color: Colors.black54)),
                                )
                              ],
                            ),
                            onPressed: () {
                              Navigator.of(context).pushReplacementNamed(
                                  CreateAccount.routeName);
                            },
                            shape: StadiumBorder(
                                side: BorderSide(color: Colors.white70)),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Checkbox(
                                value: checkBoxValue,
                                onChanged: (bool value) {
                                  print(value);
                                  setState(() {
                                    checkBoxValue = value;
                                  });
                                }),
                            Text(
                                "Receive Promotional mails from \n Kerala Tourism.",
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 4,
                                    color: Colors.white70)),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 3,
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                              SizeConfig.blockSizeHorizontal * 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "More Options",
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 5,
                                    color: Colors.white70),
                              ),
                              SizedBox(
                                height: SizeConfig.blockSizeVertical * 1,
                              ),
                              FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  "By tapping Continue a User linked agreements and must click 'Agree and Continue' \nbox with further makes it clear to the user that an agreement has taken place.",
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal * 4,
                                      color: Colors.white70),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
