import 'package:flutter/material.dart';
import 'package:flutter_task/Conest/colore.dart';
class NotificatoinScreen extends StatefulWidget {
  String ?payload;
  NotificatoinScreen({this.payload});
  @override
  _NotificatoinScreenState createState() => _NotificatoinScreenState();
}

class _NotificatoinScreenState extends State<NotificatoinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("jbvjb"),
      ),
      body: Container(
       // height: 500,
        color: MyColore.primery,
        child: Text("${widget.payload}}"),
      ),
    );
  }
}
