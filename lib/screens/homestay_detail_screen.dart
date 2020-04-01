import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../providers/homestay.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/homestay_services_list.dart';

class ScreenArguments {
  final String id;
  final Currently currently;
  ScreenArguments(this.id, this.currently);
}

class HomestayDetail extends StatefulWidget {
  static const routeName = '/home-detail';

  @override
  _HomestayDetailState createState() => _HomestayDetailState();
}

class _HomestayDetailState extends State<HomestayDetail> {
  var switchValue = false;

  @override
  Widget build(BuildContext context) {
    final ScreenArguments homeItem = ModalRoute.of(context).settings.arguments;
    final homeData = Provider.of<HomeStay>(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(6),
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            child: Image.network(
              homeData.findById(homeItem.id).imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
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
                        color: Colors.deepOrange,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.18,
                ),
                SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.32,
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Text(
                            homeData.findById(homeItem.id).name,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Quicksand",
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.008,
                          ),
                          Text(homeData.findById(homeItem.id).address,
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: "Quicksand",
                                fontSize: 20,
                              )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.008,
                          ),
                          Text(homeItem.currently.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: "Quicksand",
                                fontSize: 20,
                              )),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              homeData.findById(homeItem.id).disableFriendly
                                  ? Column(
                                      children: <Widget>[
                                        Icon(
                                          Icons.accessible,
                                          color: Colors.green,
                                          size: 32,
                                        ),
                                        FittedBox(
                                          child: const Text("Disable Friendly",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 12)),
                                        )
                                      ],
                                    )
                                  : Column(
                                      children: <Widget>[
                                        Icon(
                                          Icons.accessible,
                                          color: Colors.red,
                                          size: 32,
                                        ),
                                        FittedBox(
                                          child: const Text("Disable Friendly",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 12)),
                                        )
                                      ],
                                    ),
                              homeData.findById(homeItem.id).childFriendly
                                  ? Column(
                                      children: <Widget>[
                                        Icon(
                                          Icons.child_friendly,
                                          color: Colors.green,
                                          size: 32,
                                        ),
                                        FittedBox(
                                          child: const Text(
                                            "Child Friendly",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 12),
                                          ),
                                        )
                                      ],
                                    )
                                  : Column(
                                      children: <Widget>[
                                        Icon(
                                          Icons.child_friendly,
                                          color: Colors.red,
                                          size: 32,
                                        ),
                                        FittedBox(
                                          child: const Text(
                                            "Child Friendly",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 12),
                                          ),
                                        )
                                      ],
                                    ),
                              homeData.findById(homeItem.id).ecoFriendly
                                  ? Column(
                                      children: <Widget>[
                                        Icon(
                                          MdiIcons.tree,
                                          color: Colors.green,
                                          size: 32,
                                        ),
                                        FittedBox(
                                          child: const Text(
                                              "Environment Friendly",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 12)),
                                        )
                                      ],
                                    )
                                  : Column(
                                      children: <Widget>[
                                        Icon(
                                          MdiIcons.tree,
                                          color: Colors.red,
                                          size: 32,
                                        ),
                                        FittedBox(
                                          child: const Text(
                                              "Environment Friendly",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 12)),
                                        )
                                      ],
                                    ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              !switchValue
                                  ? Text(
                                      "Services",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      "Services",
                                      style: TextStyle(
                                          color: Colors.grey,
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
                                          fontWeight: FontWeight.bold))
                                  : Text("Reviews",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                !switchValue
                    ? HomestayServicesList(homeItem.id)
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.32,
                        width: double.infinity,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              'Sustainability Index :${homeData.findById(homeItem.id).susIndex.toString()}/5',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                                'Review Index :${homeData.findById(homeItem.id).reviewIndex.toString()}/5',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                                'Disability Index :${homeData.findById(homeItem.id).disabIndex.toString()}/5',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 19,
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
