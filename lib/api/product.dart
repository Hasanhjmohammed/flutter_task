import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_task/Conest/uri.dart';
import 'package:http/http.dart'as http;
import '../model/productmodel.dart';

class products with ChangeNotifier{
   List <product>productlist=[];
Future<void>getdate()async{
  //final store = await openStore();
 // final box = store.box<product>();
  try{
    http.Response res =await  http.get(Uri.parse(MyUri.producturi),);
    print(res.statusCode.toString());
   if(res.statusCode==200) {
     final extractdate = json.decode(res.body) as Map<String, dynamic>;
     print(extractdate.length);
     //for(int i=0;i<extractdate.length;i++){

     if(productlist.isEmpty){
       extractdate.forEach((key, value) {
         print("${value[2]['id']}ooooooooooooo");
         for(int i=0;i<value.length;i++){
           productlist.add(
             product(
               name: value[i]['name'],
               id: value[i]['id'],
               price: value[i]['price'],
               rate: value[i]['rate'],
               description: value[i]['description'],
               imageUrl: value[i]['imageUrl'],
               cart: false,
               mymarket: market(name:value[i]['market']['name'],
                 address: value[i]['market']['address'],
               ),
             ),
           );
         }
     }

     );


   }
   }
   notifyListeners();
  }
  catch(e){

  }
}
}