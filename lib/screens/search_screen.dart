import 'package:Parava/screens/items_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/items_search.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemData = Provider.of<ItemsSearch>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.06,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    onPressed: () {}),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                hintText: "Search for places, destinations and vehicles"),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.06,
        ),
        FlatButton(
            onPressed: () {
              Navigator.of(context).pushNamed(ItemSearchScreen.routeName,
                  arguments: itemData.findItemTitle("Stay").id);
            },
            child: Text(
              "Stay",
              style: TextStyle(
                  color: Colors.black54, fontFamily: "OpenSans", fontSize: 18),
            )),
        FlatButton(
            onPressed: () {},
            child: Text(
              "Travel",
              style: TextStyle(
                  color: Colors.black54, fontFamily: "OpenSans", fontSize: 18),
            )),
        FlatButton(
            onPressed: () {},
            child: Text(
              "Guide",
              style: TextStyle(
                  color: Colors.black54, fontFamily: "OpenSans", fontSize: 18),
            )),
        FlatButton(
            onPressed: () {},
            child: Text(
              "Food",
              style: TextStyle(
                  color: Colors.black54, fontFamily: "OpenSans", fontSize: 18),
            ))
      ],
    );
  }
}
