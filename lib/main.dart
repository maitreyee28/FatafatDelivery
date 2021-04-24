import 'package:fatafat_delivery/screens/camera/details.dart';
import 'package:fatafat_delivery/screens/camera/main.dart';
import 'package:fatafat_delivery/screens/main_page2.dart';
import 'package:fatafat_delivery/screens/orderScreen.dart';
import 'package:fatafat_delivery/screens/phone_auth/otp_screen.dart';
import 'package:fatafat_delivery/screens/phone_auth/phone.dart';
import 'package:fatafat_delivery/screens/phone_auth/otp.dart';
import 'package:fatafat_delivery/screens/tab_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './constants/constants.dart';

import 'data_handler/appData.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        title: 'FataFat',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: Colors.blue,
          backgroundColor: Constants.SECONDARY_ACCENT,
          scaffoldBackgroundColor: Constants.PRIMARY_COLOR,
        ),
        initialRoute: FirebaseAuth.instance.currentUser == null
            ? PhoneScreen.idScreen
            : TabScreen.idScreen,
        routes: {
          HomePage.idScreen: (context) => HomePage(),
          Details.idScreen: (context) => Details("Pizza"),
          CameraScreen.idScreen: (context) => CameraScreen(),
          OTPScreen.idScreen: (context) => OTPScreen(),
          PinCodeVerificationScreen.idScreen: (context) =>
              PinCodeVerificationScreen("+91"),
          PhoneScreen.idScreen: (context) => PhoneScreen(),
          PlaceOrderButton.idScreen: (context) => PlaceOrderButton("Pizza"),
          TabScreen.idScreen: (context) => TabScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
