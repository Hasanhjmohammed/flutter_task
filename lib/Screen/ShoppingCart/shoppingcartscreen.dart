import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/Conest/colore.dart';
import 'package:flutter_task/Widget/item.dart';
import 'package:provider/provider.dart';
import '../../api/product.dart';
import '../../model/productmodel.dart';
class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    List<product>mypro=[];
    int allprice=0;
    int j=0;
    List<product>pro=Provider.of<products>(context,listen: true).productlist;
  for(int i=0;i<pro.length;i++)
    {
      if(pro[i].cart==true)
      {
        mypro.add(pro[i]);
        allprice+=mypro[j].price!;
        j++;

      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("ShoppingCart"),
        backgroundColor: MyColore.primery,
      ),
      body:mypro.isEmpty? Center(
        child: Text("No element yet "),
      ):ListView.builder(
          itemCount: mypro.length,
          itemBuilder: (context,index)=>Item(my:mypro[index] ,)),
        bottomSheet: Container(
          margin: EdgeInsets.only(bottom: 8,left: 8),
          decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(10),
         color: MyColore.primery.withOpacity(0.5),
       ),
       width: 250,
       height: 50,
       child: Padding(
         padding: EdgeInsets.only(left: 13,top: 4),
         child:Row(
           children: [
             Text("All price your products "),
             Text("$allprice",style: TextStyle(
               color: Colors.red
             ),)
           ],
         )
       ),
     ),

    );
  }
}
