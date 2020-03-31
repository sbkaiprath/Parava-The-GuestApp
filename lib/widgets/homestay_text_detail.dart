import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/homestay.dart';

class HomestayTextDetail extends StatelessWidget {
  final String id;
  final Currently currently;
  HomestayTextDetail(this.id, this.currently);
  String get currentlyText {
    switch (currently) {
      case Currently.Open:
        return "Open";
        break;
      case Currently.Closed:
        return "Closed";
        break;
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    final homeData = Provider.of<HomeStay>(context, listen: false);
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 35,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.18,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.28,
            width: MediaQuery.of(context).size.width * 0.85,
            child: Card(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Text(
                    homeData.findById(id).name,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Quicksand",
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.008,
                  ),
                  Text(homeData.findById(id).address,
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Quicksand",
                        fontSize: 20,
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.008,
                  ),
                  Text(currentlyText,
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Quicksand",
                        fontSize: 20,
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  //SizedBox(width: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {},
                        child: Text(
                          "Services",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      RaisedButton(
                        onPressed: () {},
                        child: Text(
                          "Reviews",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
