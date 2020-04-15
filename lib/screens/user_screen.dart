import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  final FirebaseUser _user;
  UserScreen(this._user);
  @override
  Widget build(BuildContext context) {
    print(_user.displayName);
    print(_user.email);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          _user.displayName,
          style: TextStyle(color: Colors.black),
        ),
        Image.network(_user.photoUrl),
        Text(_user.email, style: TextStyle(color: Colors.black)),
        Text(_user.phoneNumber, style: TextStyle(color: Colors.black)),
        Text(_user.isEmailVerified.toString(),
            style: TextStyle(color: Colors.black))
      ],
    );
  }
}
