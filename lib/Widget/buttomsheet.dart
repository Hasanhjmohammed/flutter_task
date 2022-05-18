import 'package:flutter/material.dart';

import '../Conest/colore.dart';
class ButtomSheet extends StatelessWidget {
  VoidCallback ?function;
  String ?title1;
  String ?title2;
  ButtomSheet({this.function,this.title1,this.title2});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${title1}?",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${title2}",
            style: TextStyle(color: MyColore.primery),
          ),
        ],
      ),
    );
  }
}
