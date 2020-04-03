import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  var total = 0.0;
  var _roomController = TextEditingController();
  var _fromController = TextEditingController();
  var _toController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ScreenArgumentsBook bookNow =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.green,
                    size: 35,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.57,
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
                                  //initialValue: "${counter.toString()}",
                                  controller: _roomController,
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
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.green,
                                  ),
                                  onPressed: () {
                                    counter++;
                                    setState(() {
                                      total = (counter * bookNow.amount);
                                      _roomController.text =
                                          (counter).toString();
                                    });
                                    //print(counter);
                                  }),
                              SizedBox(
                                width: 8,
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.minimize,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    if (counter == 0) {
                                      return;
                                    }
                                    counter--;
                                    setState(() {
                                      total = (counter * bookNow.amount);
                                      _roomController.text =
                                          (counter).toString();
                                    });
                                    //print(counter);
                                  }),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "x Room",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
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
                              Text(
                                "Date :",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Flexible(
                                child: TextFormField(
                                  controller: _fromController,
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
                                onPressed: () {
                                  showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2021))
                                      .then((pickedDAte) {
                                    if (pickedDAte == null) {
                                      return;
                                    }
                                    setState(() {
                                      _fromController.text =
                                          DateFormat.yMd().format(pickedDAte);
                                    });
                                  });
                                },
                              ),
                              Flexible(
                                  child: TextFormField(
                                      controller: _toController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        hintText: "To",
                                      ))),
                              IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: () {
                                    {
                                      showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime(2021))
                                          .then((pickedDate) {
                                        if (pickedDate == null) {
                                          return;
                                        }
                                        setState(() {
                                          _toController.text = DateFormat.yMd()
                                              .format(pickedDate);
                                        });
                                      });
                                    }
                                  })
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4),
                          Text(
                            "Total :",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "₹ ${total.toString()}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: <Widget>[
                          Spacer(),
                          FloatingActionButton.extended(
                              onPressed: () {},
                              label: Text(
                                "Pay Now",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  "Message to the Service Providers (optional) :",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      hintText: "Message"),
                  maxLines: 5,
                ),
              ),
              Row(
                children: <Widget>[
                  Spacer(),
                  RaisedButton(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    onPressed: () {},
                    child: Text("Submit",style: TextStyle(color: Colors.white),),
                  ),
                  SizedBox(
                    width: 12,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
