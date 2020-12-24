import 'package:Parava/screens/items_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/items_search.dart';
import '../models/size_config.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _form = GlobalKey<FormState>();
  var _entry = "";
  final _searchFocusNode = FocusNode();
  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final itemData = Provider.of<ItemsSearch>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: SizeConfig.blockSizeVertical * 4,
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          child: Form(
            key: _form,
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 4),
              child: TextFormField(
                decoration: InputDecoration(
                    errorStyle: TextStyle(fontWeight: FontWeight.w300),
                    suffixIcon: IconButton(
                        focusNode: _searchFocusNode,
                        icon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          final isFinal = _form.currentState.validate();
                          if (!isFinal) {
                            return;
                          }
                          _form.currentState.save();
                          Navigator.of(context).pushNamed(
                              ItemSearchScreen.routeName,
                              arguments: itemData.findItemTitle("Stay").id);
                        }),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          SizeConfig.blockSizeHorizontal * 10),
                    ),
                    hintText: "Search for places, destinations and vehicles"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter the item";
                  }
                  if (value.toLowerCase() != "stay") {
                    return "Invalid Entry";
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  final isFinal = _form.currentState.validate();
                  if (!isFinal) {
                    return;
                  }
                  _form.currentState.save();
                  Navigator.of(context).pushNamed(ItemSearchScreen.routeName,
                      arguments: itemData.findItemTitle("Stay").id);
                },
                textInputAction: TextInputAction.go,
              ),
            ),
          ),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 5,
        ),
        FlatButton(
            onPressed: () {},
            child: Text(
              "Stay",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: SizeConfig.blockSizeHorizontal * 5),
            )),
        FlatButton(
            onPressed: () {},
            child: Text(
              "Travel",
              style: TextStyle(
                  color: Colors.black54,
                  fontFamily: "OpenSans",
                  fontSize: SizeConfig.blockSizeHorizontal * 5),
            )),
        FlatButton(
            onPressed: () {},
            child: Text(
              "Guide",
              style: TextStyle(
                  color: Colors.black54,
                  fontFamily: "OpenSans",
                  fontSize: SizeConfig.blockSizeHorizontal * 5),
            )),
        FlatButton(
            onPressed: () {},
            child: Text(
              "Food",
              style: TextStyle(
                  color: Colors.black54,
                  fontFamily: "OpenSans",
                  fontSize: SizeConfig.blockSizeHorizontal * 5),
            ))
      ],
    );
  }
}
