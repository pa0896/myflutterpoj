import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:alt_sms_autofill/alt_sms_autofill.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';



class InputCode extends StatefulWidget {
  const InputCode({Key? key}) : super(key: key);

  @override
  State<InputCode> createState() => _InputCodeState();
}

class _InputCodeState extends State<InputCode> {
  TextEditingController textEditingController = TextEditingController();
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Stack(
          fit: StackFit.expand,
          children: [
            bgimg(),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  otpfield(),
                  Button(),
                ]
            )
          ]
      )
    );
  }

  Widget Button() =>
      Container(
          width: MediaQuery.of(context).size.width / 1.4,
          height: 45,
          decoration : BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, '/funfte');
            },
            child: const Text("Submit"),
          )
      );

  Widget otpfield() {
    return OTPTextField(
      length: 5,
      width: MediaQuery.of(context).size.width,
      fieldWidth: 80,
      style: TextStyle(
      fontSize: 17
      ),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.underline,
      onCompleted: (pin) {
      print("Completed: " + pin);
      },
    );
  }

  Widget bgimg() =>
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          child: Image.asset('images/background.jpg',
              fit: BoxFit.fitHeight),
        ),
      );
}

