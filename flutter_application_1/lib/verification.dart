import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Verification extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  final phonecontroller = TextEditingController();
  Future<void> verify(String phone , BuildContext context) async {
    await auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: const Duration(seconds : 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
          //Navigator.push();  //push to a different page
        },
        verificationFailed: (FirebaseAuthException e) {
          if(e.code == 'invalid-phone-number')
            print("Invalid phone number");
        },
        codeSent: (String verificationId, int? resendToken) async {
          //Update UI to show a new page
          TextField(
            decoration:  InputDecoration(labelText: "Enter your code"),
            controller : phonecontroller,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly  //enter only numbers
            ],
          );
          String smsCode = phonecontroller.text;
          PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
          await auth.signInWithCredential(credential);
          //Navigator.push(context,)

        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print("Timeout");
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}