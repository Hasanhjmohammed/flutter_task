import 'package:flutter/material.dart';
import 'package:flutter_task/Conest/colore.dart';

class MainButtom extends StatelessWidget {
  EdgeInsets ?widgit;
  String ?titel;
  VoidCallback ?function;
  MainButtom({this.widgit,this.titel,this.function});
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: function,
      child: Container(
        height: 40,
        margin: widgit,

        alignment: Alignment.bottomRight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: MyColore.primery.withOpacity(0.9),
        ),
        child:Center(child:  Text("$titel",style: TextStyle(color:Colors.white),),),),
    );
  }
}