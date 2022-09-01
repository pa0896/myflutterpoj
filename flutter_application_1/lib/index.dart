import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  Index ({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  int val = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      body : Container(
        child : ListView(
        padding: EdgeInsets.symmetric(vertical: 16),
        children: [
          RadioListTile<int>(value: 1,
            groupValue: val,
            title: Text("Shipper"),
            subtitle: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
            onChanged: (value) => setState(() => val = 1),),
          RadioListTile<int>(value: 1,
            groupValue: val,
            title: Text("Transporter"),
            subtitle: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
            onChanged: (value) => setState(() => val = 1),)
        ]
       )
      )
    );
  }
}

