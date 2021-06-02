import 'package:findcovid_19/config/palette.dart';
import 'package:findcovid_19/screens/dash/bottom_nav_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:lottie/lottie.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  String verificationId;

  bool showLoading = false;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if (authCredential?.user != null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BottomNavScreen()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      _scaffoldKey.currentState
          // ignore: deprecated_member_use
          .showSnackBar(
        SnackBar(
          backgroundColor: Palette.primaryColor,
          content: Text(
            e.message,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
    }
  }

  getMobileFormWidget(context, Size size) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: size.height * 0.02),
            child: Lottie.asset(
              "images/phone-verification-success.json",
              height: size.height * 0.4,
              alignment: Alignment.bottomCenter,
            ),
          ),
          Stack(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 10.0,
                margin: EdgeInsets.all(12.0),
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 13.0,
                              color: Colors.black,
                              letterSpacing: 0.5,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Login with mobile number\n\n\n",
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0278AE),
                                ),
                              ),
                              TextSpan(
                                text: "We will send you an",
                                style: TextStyle(
                                  color: Color(0xFF373A40),
                                ),
                              ),
                              TextSpan(
                                text: " One Time Password (OTP) ",
                                style: TextStyle(
                                  color: Color(0xFF373A40),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(text: "on this mobile number"),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: size.height * 0.045),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TextField(
                            controller: phoneController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFD4D4D4),
                                  width: 1.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFD4D4D4),
                                  width: 1.0,
                                ),
                              ),
                              hintText: "(+91)Enter Your Mobile Number.",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      // ignore: deprecated_member_use
                      MaterialButton(
                        height: 58,
                        minWidth: 340,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(12)),
                        onPressed: () async {
                          setState(() {
                            showLoading = true;
                          });

                          await _auth.verifyPhoneNumber(
                            phoneNumber: phoneController.text,
                            verificationCompleted: (phoneAuthCredential) async {
                              setState(() {
                                showLoading = false;
                              });
                              //signInWithPhoneAuthCredential(phoneAuthCredential);
                            },
                            verificationFailed: (verificationFailed) async {
                              setState(() {
                                showLoading = false;
                              });
                              // ignore: deprecated_member_use
                              _scaffoldKey.currentState.showSnackBar(
                                SnackBar(
                                  backgroundColor: Palette.primaryColor,
                                  content: Text(
                                    verificationFailed.message,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            },
                            codeSent: (verificationId, resendingToken) async {
                              setState(() {
                                showLoading = false;
                                currentState =
                                    MobileVerificationState.SHOW_OTP_FORM_STATE;
                                this.verificationId = verificationId;
                              });
                            },
                            codeAutoRetrievalTimeout: (verificationId) async {},
                          );
                        },
                        child: Text(
                          "SEND",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        color: Palette.primaryColor,
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  getOtpFormWidget(context, Size size) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Lottie.asset(
              "images/otpverification.json",
              height: 300.0,
              width: 250.0,
            ),
          ),
          Stack(
            children: [
              Container(
                height: size.height * 0.45,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 10.0,
                      spreadRadius: 0.0,
                      offset: Offset(2.0, 5.0),
                    ),
                  ],
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 10.0,
                  margin: EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 40.0),
                        padding: EdgeInsets.all(20.0),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "Verification\n\n",
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color: Palette.primaryColor,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "Enter the OTP send to your mobile number",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF373A40),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: TextField(
                          controller: otpController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFD4D4D4),
                                width: 1.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFD4D4D4),
                                width: 1.0,
                              ),
                            ),
                            hintText: "Enter the OTP.",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      // ignore: deprecated_member_use
                      MaterialButton(
                        height: 58,
                        minWidth: 300,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(12)),
                        onPressed: () async {
                          PhoneAuthCredential phoneAuthCredential =
                              PhoneAuthProvider.credential(
                                  verificationId: verificationId,
                                  smsCode: otpController.text);

                          signInWithPhoneAuthCredential(phoneAuthCredential);
                        },
                        child: Text(
                          "VERIFY",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        color: Palette.primaryColor,
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        key: _scaffoldKey,
        body: Container(
          child: showLoading
              ? Center(
                  child: Container(
                    width: double.infinity,
                    child: Lottie.asset(
                      "images/wait.json",
                      height: 300.0,
                      width: 250.0,
                      alignment: Alignment.center,
                    ),
                  ),
                )
              : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                  ? getMobileFormWidget(context, size)
                  : getOtpFormWidget(context, size),
          padding: const EdgeInsets.all(16),
        ));
  }
}
