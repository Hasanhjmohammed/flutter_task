import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/Screen/ShoppingCart/shoppingcartscreen.dart';
import 'package:flutter_task/Widget/item.dart';
import 'package:flutter_task/Widget/notification.dart';
import 'package:flutter_task/api/product.dart';
import 'package:provider/provider.dart';

import '../../model/productmodel.dart';
class MyProduct extends StatefulWidget {
  late notification mynotifiy;
  @override
  _MyProductState createState() => _MyProductState();
}
class _MyProductState extends State<MyProduct> {


  bool isloding=true;
  @override
  void initState() {
    widget.mynotifiy=notification();
    widget.mynotifiy.initaliazationnotification();
  Provider.of<products>(context,listen: false).getdate().then((value) =>isloding=false );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    List<product>pro=[];
   pro=pro.isEmpty?Provider.of<products>(context,listen: true).productlist:pro;
    return Scaffold(
      appBar: AppBar(
        actions: [
        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (con)=>ShoppingCart()));
        }, icon: Padding(
          padding: EdgeInsets.only(right: 3),
         child: Icon(Icons.shopping_cart,size: 30,),),
    )
        ],
        leading: Icon(Icons.menu),
      backgroundColor: Colors.green,
        title:const  Text("Products"),
      ),
      body:isloding ?Center(child: CircularProgressIndicator(),): ListView.builder(
        itemCount: pro.length,
        itemBuilder: (context,index)=>Item(my:pro[index]),
      ),

    );
  }
}
