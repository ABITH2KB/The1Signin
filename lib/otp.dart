import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signin_1/profile.dart';
import 'package:signin_1/signup.dart';



class Otpup extends StatefulWidget {
  final String verificationId;
  Otpup({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<Otpup> createState() => _OtpupState();
}

class _OtpupState extends State<Otpup> {
  final TextEditingController OtpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'asset/images/image5.jpeg',
            fit: BoxFit.cover,
          ),
          // Second image positioned 100 pixels from the top
          Positioned(
            top: 200,
            left: 0, // You can adjust left/right position if needed
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Adjust padding as needed
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'O T P',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 35,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          controller: OtpController, // Use the controller here
                          decoration: InputDecoration(
                            labelText: '',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      // Repeat similar TextFormField widgets if needed
                    ],
                  ),
                  SizedBox(height: 50),
                  Text(
                    "I Didn't receive OTP? Resend",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        PhoneAuthCredential credential = PhoneAuthProvider.credential(
                            verificationId: widget.verificationId,
                            smsCode: OtpController.text);
                        await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Chappak())); // Assuming 'Home' is the target screen
                        });
                      } catch (ex) {
                        log(ex.toString());
                      }
                    },
                    child: SizedBox(
                      width: 300,
                      height: 60,
                      child: Center(
                        child: Text('V e r i f y',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black87.withOpacity(
                          0.8), // Set the button's background color
                      onPrimary: Colors.black, // Set the text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
