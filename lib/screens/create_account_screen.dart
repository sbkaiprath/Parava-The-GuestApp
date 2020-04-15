import 'package:flutter/material.dart';
import '../models/size_config.dart';
import 'package:Parava/my_flutter_app_icons.dart';

enum AuthMode { Login, SignUp }

class CreateAccount extends StatelessWidget {
  static const routeName = '/login';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: (SizeConfig.screenHeight) * 1,
                width: SizeConfig.screenWidth,
                child: Image.network(
                  "https://cdn.pixabay.com/photo/2016/09/02/14/25/kerala-1639325_960_720.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: (SizeConfig.screenHeight * 1),
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.lightBlue.withOpacity(0.1), Colors.lightBlue],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        BoxContainer()
      ],
    ));
  }
}

class BoxContainer extends StatefulWidget {
  const BoxContainer({
    Key key,
  }) : super(key: key);

  @override
  _BoxContainerState createState() => _BoxContainerState();
}

class _BoxContainerState extends State<BoxContainer>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  AnimationController _controller;
  Animation<double> _opacityAnimation;
  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.SignUp;
      });
      _controller.forward();
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
      _controller.reverse();
    }
  }

  void _submit() {
    if (_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
  }

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _opacityAnimation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.elasticIn));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: _authMode == AuthMode.SignUp
                ? SizeConfig.blockSizeVertical * 50
                : SizeConfig.blockSizeVertical * 40,
            width: SizeConfig.blockSizeHorizontal * 80,
            constraints: BoxConstraints(
                minHeight: _authMode == AuthMode.SignUp
                    ? SizeConfig.blockSizeVertical * 50
                    : SizeConfig.blockSizeVertical * 40),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.black26,
                    offset: Offset(0, 2),
                  )
                ],
                color: Colors.black38,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    "${_authMode == AuthMode.Login ? 'Login' : 'Sign Up'}",
                    style: TextStyle(
                        color: Colors.white70,
                        fontFamily: "Quicksand",
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                hintText:
                                    "${_authMode == AuthMode.Login ? 'Username' : 'Enter Username'}",
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.blockSizeHorizontal * 8))),
                            validator: (value) {
                              if (value.isEmpty || !value.contains('@')) {
                                return 'Invalid email!';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 2,
                          ),
                          TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText:
                                      "${_authMode == AuthMode.Login ? 'Password' : 'Enter Password'}",
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.blockSizeHorizontal *
                                              8))),
                              validator: (value) {
                                if (value.isEmpty || value.length < 5) {
                                  return 'Password is too short!';
                                }
                                return null;
                              }),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 2,
                          ),
                          if (_authMode == AuthMode.SignUp)
                            FadeTransition(
                              opacity: _opacityAnimation,
                              child: TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: "Confirm Password",
                                    enabled: _authMode == AuthMode.SignUp,
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            SizeConfig.blockSizeHorizontal *
                                                8))),
                              ),
                            ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              RaisedButton(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.blockSizeHorizontal * 6)),
                                onPressed: () => _switchAuthMode(),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "${_authMode == AuthMode.Login ? 'Sign Up' : 'Log In'}",
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 17),
                                  ),
                                ),
                                color: Colors.blue,
                              ),
                              RaisedButton(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.blockSizeHorizontal * 6)),
                                onPressed: () => _submit(),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      "${_authMode == AuthMode.Login ? 'Sign In' : 'Sign Up'}",
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 17)),
                                ),
                                color: Colors.blue,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton.extended(
                                  backgroundColor: Colors.black38,
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushReplacementNamed('/');
                                  },
                                  label: Icon(MyFlutterApp.google,
                                      color: Colors.white60,
                                      size:
                                          SizeConfig.blockSizeHorizontal * 6))
                            ],
                          )
                        ],
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
