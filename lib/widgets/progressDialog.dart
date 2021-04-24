import 'package:fatafat_delivery/constants/constants.dart';
import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  final String message;
  ProgressDialog({this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Constants.PRIMARY_ACCENT,
      child: Container(
        margin: EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Constants.PRIMARY_ACCENT,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              SizedBox(width: 6.0),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
              SizedBox(
                width: 26.0,
              ),
              Text(
                message,
                style: TextStyle(color: Colors.black, fontSize: 15.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
