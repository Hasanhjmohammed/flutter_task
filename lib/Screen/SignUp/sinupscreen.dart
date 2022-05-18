import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/Conest/colore.dart';

import 'package:flutter_task/Screen/Product/productscreen.dart';
import 'package:flutter_task/Widget/mydialog.dart';
import 'package:flutter_task/api/auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../Widget/buttomsheet.dart';
import '../../Widget/mainbuttom.dart';
import '../../model/usermodel.dart';
import '../LogIn/loginscreen.dart';
import 'mulitinput.dart';

class SinUp extends StatefulWidget {
  bool isloding=false;
  @override
  _SinUpState createState() => _SinUpState();
}

class _SinUpState extends State<SinUp> {
  String? name;
  String? full;
  String? pass;
  String? phone;
  String? city;
  user ?I=user();
  GlobalKey<FormState> _mykey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: MyColore.primery,),
          onPressed: (){Navigator.of(context).pop();},),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          Icon(
            Icons.shopping_cart_outlined,
            color: MyColore.primery.withOpacity(0.8),
            size: MediaQuery.of(context).size.height * 0.07,
          ),
        ],
      ) ,
      backgroundColor: Colors.grey.shade300,
      body: ModalProgressHUD(
    color: MyColore.primery.withOpacity(0.2),
    inAsyncCall: widget.isloding,
    child:Padding(
        padding: const EdgeInsets.only(top: 0, left: 15, right: 15),
        child: Form(
          key: _mykey,
          child: Consumer<auth>(
              builder: (context, value, child) => SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Sign \n     up",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: MyColore.primery,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.08),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(left: 5,right: 5),
                          child: MulityInput(
                                      I:I
                          ),),
                          SizedBox(height: 10,),
                          MainButtom(
                            titel: "Register",
                            function: () async{
                              setState(() {
                                widget.isloding=true;
                              });
                              if (!_mykey.currentState!.validate()) {
                                return null;
                              }
                                  try{
                               await  value.register(
                              I!.name!,
                               I!.pass!,
                                I!.phone!,
                               I!.full!,
                                  I!.city!);
                                   // I.name!);
                                   setState(() {
                                  widget.isloding=false;
                                    });
                               Navigator.of(context).push(
                                   MaterialPageRoute(
                                       builder: (context) => MyProduct()));

                                  }
                              catch(e){
                                     setState(() {
                               widget.isloding=false;
                                });
                                showDialog(context: context, builder: (context)=>MyDialog(error: e.toString(),));
                              }

                            }),
                         const  SizedBox(
                            height: 60,
                          ),
                          ButtomSheet(
                            title1:"Do have an account" ,
                            title2: "Register",
                            function: () =>
                           Navigator.of(context).pop(
                              )

                            ,),
                        ]),
                  )),
        ),
    )),
    );
  }
}
