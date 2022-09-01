import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/verification.dart';

class PhoneAuth extends StatefulWidget {
  PhoneAuth({Key? key}) : super(key:key);

  @override
  _PhoneAuthState createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  final myController = TextEditingController();
  Verification ver = Verification();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        //width : MediaQuery.of(context).size.width,  //fill container to max screen size
        //height : MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/background.jpg"),
              fit: BoxFit.fitHeight
          )
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
             TextField(
              decoration: const InputDecoration(labelText: "Enter your number"),
              controller : myController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly  //enter only numbers
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration : BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
                child: MaterialButton(onPressed: () {
                  Navigator.pushNamed(context,"/dritte");
                   ver.verify(myController.text,context);
                },
                  child: const Text("Submit"))
            ),
          ],
        )
      ),
    );
  }
}