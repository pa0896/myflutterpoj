import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/phoneauth.dart';
import 'package:flutter_application_1/verification.dart';
import 'package:flutter_application_1/index.dart';
import 'package:flutter_application_1/inputcode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes:{
        '/' : (context) => const MyApp(),
        '/zweite' : (context) => PhoneAuth(),
        '/dritte' : (context) => InputCode(),
        '/vierte' : (context) => Verification(),
        '/funfte' : (context) => Index(),
      },
    )
      );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  String? selectedItem = 'English';

  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            fit: StackFit.expand,
            children: [
              BackImg(),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropDown(),
                    SubmitButton(),
                  ]
              )
            ]
        )
    );
  }

  Widget BackImg() =>
      ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            child: Image.asset('images/background.jpg',
                  fit: BoxFit.fitHeight),
            ),
          );

  Widget DropDown() =>
      Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 4)
          ),
          child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                icon: Icon(Icons.keyboard_arrow_down, size: 20),
                value: selectedItem,
                items: const [
                  DropdownMenuItem(
                      value: "English",
                      child: Text("English",
                          style: TextStyle(fontSize: 15, color: Colors.black))
                  ),
                  DropdownMenuItem(
                      value: "German",
                      child: Text("German",
                          style: TextStyle(fontSize: 15, color: Colors.black))
                  ),
                  DropdownMenuItem(
                      value: "Hindi",
                      child: Text("Hindi",
                          style: TextStyle(fontSize: 15, color: Colors.black))
                  )
                ],
                onChanged: (val) {
                  setState(() {
                    selectedItem = val.toString();
                  });
                },
              )
          )
      );

  Widget SubmitButton() =>
      Container(
          width: MediaQuery.of(context).size.width / 1.4,
          height: 45,
          decoration : BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
        child: MaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, '/zweite');
        },
        child: const Text("Submit"),
      )
      );
}
