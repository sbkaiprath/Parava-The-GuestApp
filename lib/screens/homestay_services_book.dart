import 'package:flutter/material.dart';

class ScreenArgumentsBook {
  final String name;
  final double amount;
  final String homestayName;
  ScreenArgumentsBook(this.name, this.amount, this.homestayName);
}

class HomestayServiceBook extends StatefulWidget {
  static const routeName = "/homestay-book";

  @override
  _HomestayServiceBookState createState() => _HomestayServiceBookState();
}

class _HomestayServiceBookState extends State<HomestayServiceBook> {
  var counter = 0;
  @override
  Widget build(BuildContext context) {
    final ScreenArgumentsBook bookNow =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.60,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Check Out",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Quicksand",
                            fontSize: 33,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        bookNow.homestayName,
                        style: TextStyle(
                            color: Colors.black45,
                            fontFamily: "Quicksand",
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Flexible(
                                child: TextFormField(
                                  initialValue: "${counter.toString()}",
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    hintText: "Rooms",
                                  ),
                                  readOnly: true,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      counter++;
                                    });
                                  }),
                              SizedBox(
                                width: 8,
                              ),
                              IconButton(
                                  icon: Icon(Icons.minimize), onPressed: () {}),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "x Rooms",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Flexible(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    hintText: "From",
                                  ),
                                  readOnly: true,
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: () {}),
                              Flexible(
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                hintText: "To",
                              ))),
                              IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: () {})
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
