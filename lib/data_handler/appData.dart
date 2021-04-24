import 'package:flutter/cupertino.dart';

class AppData extends ChangeNotifier {
  String address;
  void updateAddress(String newAddress) {
    address = newAddress;
    notifyListeners();
  }
}
