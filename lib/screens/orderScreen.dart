import 'package:fatafat_delivery/constants/constants.dart';
import 'package:flutter/material.dart';

class PlaceOrderButton extends StatelessWidget {
  static const String idScreen = "order";
  PlaceOrderButton(this.data);
  final String data;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.PRIMARY_ACCENT,
      margin: EdgeInsets.only(top: 30.0),
      width: 250.0,
      height: 50.0,
      // ignore: deprecated_member_use
      child: Column(
        children: [
          Text("Food being ordered is:",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54)),
          Text(data, style: TextStyle(color: Colors.black)),
          RaisedButton(
              color: Colors.deepOrange,
              child: Text(
                "Place Order",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              elevation: 6.0,
              onPressed: () => Place_Order(context)),
        ],
      ),
    );
  }

  void Place_Order(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Order Successfully Placed"),
      content: Text("Thank you for ordering from Fatafat"),
    );

    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }
}
