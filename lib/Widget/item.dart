import 'package:flutter/material.dart';
import 'package:flutter_task/Conest/colore.dart';
import 'package:flutter_task/Screen/Product/productscreen.dart';
import 'package:provider/provider.dart';

import '../Screen/DetailsPr/details.dart';
import '../api/product.dart';
import '../model/productmodel.dart';
class Item extends StatefulWidget {
  product ?my;
  Item({this.my});
  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (con)=>Detail(my: widget.my,)));
      },
      highlightColor: Colors.orangeAccent.withOpacity(0.3),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 15,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),

                  child: Image.network(widget.my!.imageUrl!,
                      fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                    ),
                  ),

                Container(
                  alignment: Alignment.bottomLeft,
                  height: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.8),
                      ],
                      stops: [
                        0.6,
                        1
                      ],
                    ),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.my!.name!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 1,right: 1,top: 15,bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Row(
                    children: [
                      Icon(Icons.money,
                        color:MyColore.primery,),
                      Text("${widget.my!.price}"),
                    ],
                  ),
                  Row(
                    children: [
                      widget.my!.rate<4?
                      Icon(Icons.star_half_sharp,
                        color: MyColore.primery,):
                     Icon(Icons.star,
                        color: MyColore.primery,),
                    Text("${widget.my!.rate}"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.account_balance_sharp,
                        color: MyColore.primery,),
                      Text("${widget.my!.mymarket.name!}"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

