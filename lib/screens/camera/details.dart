import 'package:clipboard/clipboard.dart';
import 'package:fatafat_delivery/screens/orderScreen.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  static const String idScreen = "details";

  final String text;
  Details(this.text);
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text('Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.copy),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          PlaceOrderButton(widget.text)));
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        child: SelectableText(
            widget.text.isEmpty ? 'No Text Available' : widget.text),
      ),
    );
  }
}
