import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class Mpa extends StatefulWidget {
  @override
  _MpaState createState() => _MpaState();
}

class _MpaState extends State<Mpa> {
  String ?name;
  String?pass;
  String?phone;
  String?full;
  String?city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            onChanged: (
                val
                ){
              name=val;
            },
          ),
          TextField(
            onChanged: (
                val
                ){
              pass=val;
            },
          ),
          TextField(
            onChanged: (
                val
                ){
              full=val;
            },
          ),
          TextField(
            onChanged: (
                val
                ){
              phone=val;
            },
          ),
          TextField(
            onChanged: (
                val
                ){
              city=val;
            },
          ),
          TextButton(onPressed: ()async {
            http.Response res=await http.post(Uri.parse("https://flutter-task-hala-tech.herokuapp.com/user_register"),body: {
              "userName":name,
              "password":pass,
              "fullName":full,
              'phoneNumer':phone,
              "city":city
            });
            print(res.body);
          } ,child: Text(",sbmc,b")),
        ],
      ),
    );
  }
}
