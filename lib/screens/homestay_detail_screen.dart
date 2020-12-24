import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/homestay_services_list.dart';
import '../models/size_config.dart';

class HomestayDetail extends StatefulWidget {
  static const routeName = '/home-detail';
  @override
  _HomestayDetailState createState() => _HomestayDetailState();
}

class _HomestayDetailState extends State<HomestayDetail> {
  var switchValue = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final DocumentSnapshot _homeItem =
        ModalRoute.of(context).settings.arguments;
    //final homeData = Provider.of<HomeStay>(context);
    final check = Card(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: SizeConfig.blockSizeVertical * 2,
          ),
          Text(
            _homeItem['name'],
            style: TextStyle(
                color: Colors.black,
                fontSize: SizeConfig.blockSizeHorizontal * 7,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 0.8,
          ),
          Text(_homeItem['address'],
              style: TextStyle(
                color: Colors.grey,
                fontFamily: "Quicksand",
                fontSize: SizeConfig.blockSizeHorizontal * 5,
              )),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 0.8,
          ),
          Text(_homeItem['currently'],
              style: TextStyle(
                color: Colors.grey,
                fontFamily: "Quicksand",
                fontSize: SizeConfig.blockSizeHorizontal * 5,
              )),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _homeItem['disableFriendly']
                  ? Column(
                      children: <Widget>[
                        Icon(
                          Icons.accessible,
                          color: Colors.green,
                          size: SizeConfig.blockSizeHorizontal * 8,
                        ),
                        FittedBox(
                          child: Text("Disable Friendly",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal * 3)),
                        )
                      ],
                    )
                  : Column(
                      children: <Widget>[
                        Icon(
                          Icons.accessible,
                          color: Colors.red,
                          size: SizeConfig.blockSizeHorizontal * 8,
                        ),
                        FittedBox(
                          child: Text("Disable Friendly",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal * 3)),
                        )
                      ],
                    ),
              _homeItem['childFriendly']
                  ? Column(
                      children: <Widget>[
                        Icon(
                          Icons.child_friendly,
                          color: Colors.green,
                          size: SizeConfig.blockSizeHorizontal * 8,
                        ),
                        FittedBox(
                          child: Text(
                            "Child Friendly",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: SizeConfig.blockSizeHorizontal * 3),
                          ),
                        )
                      ],
                    )
                  : Column(
                      children: <Widget>[
                        Icon(
                          Icons.child_friendly,
                          color: Colors.red,
                          size: SizeConfig.blockSizeHorizontal * 8,
                        ),
                        FittedBox(
                          child: Text(
                            "Child Friendly",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: SizeConfig.blockSizeHorizontal * 3),
                          ),
                        )
                      ],
                    ),
              _homeItem['ecoFriendly']
                  ? Column(
                      children: <Widget>[
                        Icon(
                          MdiIcons.tree,
                          color: Colors.green,
                          size: SizeConfig.blockSizeHorizontal * 8,
                        ),
                        FittedBox(
                          child: Text("Environment Friendly",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal * 3)),
                        )
                      ],
                    )
                  : Column(
                      children: <Widget>[
                        Icon(
                          MdiIcons.tree,
                          color: Colors.red,
                          size: SizeConfig.blockSizeHorizontal * 8,
                        ),
                        FittedBox(
                          child: Text("Environment Friendly",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal * 3)),
                        )
                      ],
                    ),
            ],
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              !switchValue
                  ? Text(
                      "Services",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.blockSizeHorizontal * 4,
                          fontWeight: FontWeight.bold),
                    )
                  : Text(
                      "Services",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: SizeConfig.blockSizeHorizontal * 4,
                          fontWeight: FontWeight.bold),
                    ),
              Switch(
                  value: switchValue,
                  onChanged: (bool value) {
                    print(value);
                    setState(() {
                      switchValue = value;
                    });
                  }),
              switchValue
                  ? Text("Reviews",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.blockSizeHorizontal * 4,
                          fontWeight: FontWeight.bold))
                  : Text("Reviews",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: SizeConfig.blockSizeHorizontal * 4,
                          fontWeight: FontWeight.bold))
            ],
          )
        ],
      ),
    );
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(6),
            height: SizeConfig.blockSizeVertical * 45,
            width: double.infinity,
            child: Image.network(
              _homeItem['imageurl'],
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            padding: EdgeInsets.only(top: SizeConfig.blockSizeHorizontal * 13),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: SizeConfig.blockSizeHorizontal * 9,
                        color: Colors.deepOrange,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 16,
                ),
                SingleChildScrollView(
                    child: MediaQuery.of(context).size.width > 360
                        ? Container(
                            height: SizeConfig.blockSizeVertical * 33,
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: check)
                        : Container(
                            height: SizeConfig.blockSizeVertical * 37,
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: check)),
                !switchValue
                    ? _homeItem['services'].length != 0
                        ? HomestayServicesList(_homeItem)
                        : Center(
                            child: Text(
                              'No Services provided currently',
                              style: TextStyle(color: Colors.black),
                            ),
                          )
                    : Container(
                        height: MediaQuery.of(context).size.width > 360
                            ? MediaQuery.of(context).size.height * 0.32
                            : MediaQuery.of(context).size.height * 0.30,
                        width: double.infinity,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 1,
                            ),
                            Text(
                              'Sustainability Index :' +
                                  _homeItem['susIndex'].toString() +
                                  '/5',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal * 4.5,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 1,
                            ),
                            Text(
                                'Review Index :' +
                                    _homeItem['reviewIndex'].toString() +
                                    '/5',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 4.5,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 1,
                            ),
                            Text(
                                'Disability Index :' +
                                    _homeItem['disbledIndex'].toString() +
                                    '/5',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 4.5,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
