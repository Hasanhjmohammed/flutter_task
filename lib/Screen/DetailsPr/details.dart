import 'package:flutter/material.dart';
import 'package:flutter_task/Screen/Product/productscreen.dart';
import 'package:flutter_task/Widget/notification.dart';
import '../../Conest/colore.dart';
import '../../model/productmodel.dart';
import '../ShoppingCart/shoppingcartscreen.dart';
import '/api/product.dart';
class Detail extends StatefulWidget {
  product ?my;
  Detail({this.my});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  void setState(VoidCallback fn) {

    // TODO: implement setState

    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColore.primery,
        title: const Text("Product"),
      ),
      body:Padding(
        padding: EdgeInsets.all(7),
        child:   Column(

          children: [
            Container(
              height: 450,
              width: double.infinity,
              child: Image.network(widget.my!.imageUrl!,
                fit: BoxFit.cover,),
            ),
            Expanded(
              flex: 3,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpText("Adress",30),
                  Text("${widget.my!.mymarket.address}",style: TextStyle(
                      fontSize: 15
                  ),
                  ),
                  Divider(
                    color: MyColore.primery,
                  ),
                  SpText("Detail", 35),
                  Text("${widget.my!.description}",style: TextStyle(
                      fontSize: 15
                  ),
                  ),
                ],
              ), ),
        Align(
         alignment: Alignment.bottomRight,
         child:
       Container(
        decoration: BoxDecoration(
          color: MyColore.primery.withOpacity(0.1),
          borderRadius: BorderRadius.circular(7),
        ),
        child:  TextButton.icon(onPressed: (){
          notification().desplaynotification(title: "Product :${widget.my!.name} ",body:widget.my!.cart==false?"Successfully added to cart":
          "Successfully removed from cart" );
          setState(() {
            widget.my!.cart=!widget.my!.cart!;
          });

                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context)=>MyProduct()));

        },
            icon: Icon(widget.my!.cart==false ?Icons.shopping_cart_sharp:Icons.remove_shopping_cart_rounded,
              size: 35,color: MyColore.primery,),
            label: Text(widget.my!.cart==false ?"Add":"remove",style: TextStyle(fontSize: 26,color: MyColore.primery),)),),
      )
          ],
        ),
      )

    );
  }
  Widget SpText(String t,double size){
    return  Text(t,
      style: TextStyle(

          fontSize: size,
          fontWeight: FontWeight.bold,
          color: MyColore.primery

      ),
    );
  }
}
