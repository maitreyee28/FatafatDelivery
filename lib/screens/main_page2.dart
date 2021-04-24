import 'package:fatafat_delivery/assistants/assistantMethods.dart';
import 'package:fatafat_delivery/constants/constants.dart';
import 'package:fatafat_delivery/data_handler/appData.dart';
import 'package:fatafat_delivery/models/dishes.dart';
import 'package:fatafat_delivery/screens/orderScreen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'dart:convert' show json;

class HomePage extends StatefulWidget {
  static const String idScreen = "main_screen";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double lat, lng;
  String userAddress = "Loading...";
  @override
  Future<void> initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      updateAddress();
    });
  }

  void updateAddress() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    String address = await AssistantMethods.getPlaceDetails(
        position.latitude, position.longitude, context);
    Provider.of<AppData>(context, listen: false).updateAddress(address);
    print(address);
    setState(() {
      userAddress = address;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.SECONDARY_ACCENT,
      body: SafeArea(
        top: false,
        bottom: false,
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        height: 190,
                        decoration: BoxDecoration(
                            color: Constants.SECONDARY_COLOR,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30.0),
                                bottomRight: Radius.circular(30.0))),
                        child: Container(
                          margin: EdgeInsets.only(top: 25.0),
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Delivery Address',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Constants.PRIMARY_COLOR),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: Text(
                                      userAddress,
                                      style: TextStyle(
                                          color: Constants.PRIMARY_ACCENT,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextButton(
                                      child: Text("Edit Address".toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white)),
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all<
                                                EdgeInsets>(
                                            EdgeInsets.symmetric(
                                                horizontal: 99, vertical: 15)),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Constants.SECONDARY_ACCENT),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                            // side: BorderSide(color: Colors.red),
                                          ),
                                        ),
                                      ),
                                      onPressed: () => null),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 300,
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        decoration: BoxDecoration(
                            color: Constants.SECONDARY_COLOR,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 8),
                          child: Column(
                            children: [
                              Text(
                                "Recent Orders  ",
                                // authstate.user.primaryLocation.split(",")[0],
                                style: TextStyle(
                                    color: Constants.PRIMARY_COLOR,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10.0),
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                // margin: EdgeInsets.symmetric(vertical: 20.0),
                                height: 200.0,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      width: 160.0,
                                      height: 160,
                                      child: Column(
                                        children: [
                                          Image.network(
                                              'https://spoonacular.com/menuItemImages/pizza.jpg'),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("Pizza"),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("Restaurant: Foodies"),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("Price: 180"),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("Rating: 100"),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (BuildContext
                                                        context) =>
                                                    PlaceOrderButton("Pizza")));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        width: 160.0,
                                        height: 160,
                                        child: Column(
                                          children: [
                                            Image.network(
                                                'https://spoonacular.com/menuItemImages/pizza.jpg'),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text("Pizza"),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text("Restaurant: Foodies"),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text("Price: 180"),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text("Rating: 100"),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      width: 160.0,
                                      height: 160,
                                      child: Column(
                                        children: [
                                          Image.network(
                                              'https://spoonacular.com/menuItemImages/pizza.jpg'),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("Pizza"),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("Restaurant: Foodies"),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("Price: 180"),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("Rating: 100"),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      width: 160.0,
                                      height: 160,
                                      child: Column(
                                        children: [
                                          Image.network(
                                              'https://spoonacular.com/menuItemImages/pizza.jpg'),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("Pizza"),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("Restaurant: Foodies"),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("Price: 180"),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("Rating: 100"),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
