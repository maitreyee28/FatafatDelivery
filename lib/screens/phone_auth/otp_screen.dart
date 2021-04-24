import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:fatafat_delivery/screens/registerScreen.dart';
// import 'package:sms_autofill/sms_autofill.dart';

class OTPScreen extends StatefulWidget {
  static const String idScreen = "otp";

  @override
  _OTPScreen createState() => _OTPScreen();
}

class _OTPScreen extends State<OTPScreen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String strVerificationId;
  final globalKey = GlobalKey<ScaffoldState>();
  TextEditingController phoneNumEditingController = TextEditingController();
  TextEditingController smsEditingController = TextEditingController();
  bool showVerifyNumberWidget = true;
  bool showVerificationCodeWidget = false;
  bool showSuccessWidget = false;

  @override
  void initState() {
    super.initState();
    getCurrentNumber();
  }

  getCurrentNumber() async {
    phoneNumEditingController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: Text(
            "KioGo",
            style: TextStyle(
              fontSize: 35,
              fontFamily: 'ReemKufi',
            ),
          ),
        ),
        key: globalKey,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Padding(
              padding: EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (showVerifyNumberWidget)
                    TextFormField(
                      controller: phoneNumEditingController,
                      decoration: const InputDecoration(
                          labelText: 'Enter Phone number'),
                      keyboardType: TextInputType.phone,
                    ),
                  SizedBox(
                    height: 25,
                  ),
                  if (showVerifyNumberWidget)
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      alignment: Alignment.center,
                      child: RaisedButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                        color: Colors.blueAccent,
                        child: Text("Send OTP",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        onPressed: () async {
                          displayToastMessage(
                              "Please wait for the OTP", context);
                          phoneNumberVerification();
                        },
                      ),
                    ),
                  if (showVerificationCodeWidget)
                    TextFormField(
                      controller: smsEditingController,
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(labelText: 'Verification code'),
                    ),
                  SizedBox(
                    height: 25,
                  ),
                  if (showVerificationCodeWidget)
                    Container(
                      padding: const EdgeInsets.only(top: 16.0),
                      alignment: Alignment.center,
                      child: RaisedButton(
                          color: Colors.blueAccent,
                          onPressed: () async {
                            signInWithPhoneNumber();
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 25),
                            child: Text("Sign in",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          )),
                    ),
                ],
              )),
        ));
  }

  Future<void> phoneNumberVerification() async {
    PhoneVerificationCompleted phoneVerificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      await firebaseAuth.signInWithCredential(phoneAuthCredential);
      displayToastMessage(
          "Phone number is automatically verified and user signed in", context);
      // Navigator.pushNamedAndRemoveUntil(context, RegistrationScreen.idScreen,
      //     ModalRoute.withName(RegistrationScreen.idScreen),
      //     arguments: phoneNumEditingController.text);
      setState(() {
        showVerifyNumberWidget = false;
        showVerificationCodeWidget = false;
        showSuccessWidget = true;
      });
    };

    PhoneVerificationFailed phoneVerificationFailed =
        (FirebaseAuthException authException) {
      displayToastMessage(
          'Phone number verification is failed. Code: ${authException.code}. Message: ${authException.message}',
          context);
    };

    PhoneCodeSent phoneCodeSent =
        (String verificationId, [int forceResendingToken]) async {
      displayToastMessage('Please check your phone for the OTP.', context);
      strVerificationId = verificationId;
      setState(() {
        showVerifyNumberWidget = false;
        showVerificationCodeWidget = true;
      });
    };

    PhoneCodeAutoRetrievalTimeout phoneCodeAutoRetrievalTimeout =
        (String verificationId) {
      // displayToastMessage("verification code: " + verificationId, context);
      strVerificationId = verificationId;
      setState(() {
        showVerifyNumberWidget = false;
        showVerificationCodeWidget = true;
      });
    };

    try {
      await firebaseAuth.verifyPhoneNumber(
          phoneNumber: "+91" + phoneNumEditingController.text,
          timeout: const Duration(seconds: 5),
          verificationCompleted: phoneVerificationCompleted,
          verificationFailed: phoneVerificationFailed,
          codeSent: phoneCodeSent,
          codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout);
    } catch (e) {
      displayToastMessage("Failed to Verify Phone Number: $e", context);
    }
  }

  displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  void signInWithPhoneNumber() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: strVerificationId,
        smsCode: smsEditingController.text,
      );

      final User user =
          (await firebaseAuth.signInWithCredential(credential)).user;

      // displayToastMessage("Successfully signed in UID: ${user.uid}", context);
      // Provider.of<AppData>(context, listen: false).updateUID(user.uid);
      setState(() {
        showVerificationCodeWidget = false;
        showSuccessWidget = true;
      });

      // Navigator.pushNamedAndRemoveUntil(context, RegistrationScreen.idScreen,
      //     ModalRoute.withName(RegistrationScreen.idScreen),
      //     arguments: phoneNumEditingController.text);
    } catch (e) {
      final regex = RegExp(r'\].*');
      final match = regex.firstMatch(e.toString());
      final err = match.group(0).substring(2);
      displayToastMessage(err, context);
    }
  }
}
