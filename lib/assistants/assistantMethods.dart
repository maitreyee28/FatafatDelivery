import 'package:fatafat_delivery/assistants/requestAssistant.dart';
import 'package:fatafat_delivery/widgets/progressDialog.dart';
import 'package:flutter/material.dart';

class AssistantMethods {
  static Future<String> getPlaceDetails(double lat, double lng, context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) => ProgressDialog(
              message: "Please wait...",
            ));
    String placeDetails =
        "https://revgeocode.search.hereapi.com/v1/revgeocode?at=$lat%2C$lng&lang=en-US&apiKey=DqbarcfY6bX27CEViM6l8YJkkdeeHXzb7mBJBtb4MGk";
    var res = await RequestAssistant.getRequest(placeDetails);
    Navigator.pop(context);
    if (res == "failed") {
      return null;
    }
    print(res);
    String address = res['items'][0]["title"];
    return address;
  }
}
