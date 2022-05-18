import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_task/Conest/uri.dart';
import 'package:http/http.dart'as http;
import '../model/usermodel.dart';

class auth with  ChangeNotifier{
  Future<void>login(String username,String password)async{
    Map<String,String>bodyn={
      "userName":username,
      "password":password,
    };
    http.Response res =await http.post(Uri.parse(MyUri.login),
        body:bodyn );
    print(res.body);
  try{
    print(res.statusCode);
    if(res.statusCode ==200){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var jsondate=jsonDecode(res.body);
      user ?I;
      print(jsondate);
      var username=jsondate['userName'];
      I!.name=jsondate['userName'];
      I.pass=jsondate['password'];
      I.full=jsondate['fullName'];
      I.phone=jsondate['phoneNumber'];
      I.city="aleppo";
      prefs.setString("myuser", username);
      notifyListeners();
    }
    if(res.statusCode!=200)
      {  var jsondate=jsonDecode(res.body);

        throw jsondate['message'];}

  }catch(e){
    throw e;
  }
  }
Future<void>register(String username,String password,String phone,String fullname,String city)async{
  var res = await http.post(Uri.parse(MyUri.register),body:{
    "userName":username,
    "password":password,
    "fullName":fullname,
    "phoneNumber":phone,
    "city":city
  }
  );
  try{
    print(res.statusCode);
    print(res.body);
    print("=======================");
    var jsondate=jsonDecode(res.body);
    print(jsondate);
    if(res.statusCode ==200){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var jsondate=json.decode(res.body);
      print(jsondate.toString());
      var op=jsondate;
      prefs.setString("done", op);
      login(username,password);
      notifyListeners();
    }
    if(res.statusCode!=200){
      var jsondate=json.decode(res.body);
      throw jsondate['message'];
    }

  }catch(e){
    print(e);
    throw e;
  }

}
}