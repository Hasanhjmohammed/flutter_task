import 'package:flutter/material.dart';
import 'package:flutter_task/Widget/mydialog.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter_task/Screen/SignUp/sinupscreen.dart';
import 'package:flutter_task/Widget/buttomsheet.dart';
import 'package:flutter_task/Widget/inputtext.dart';
import 'package:flutter_task/api/auth.dart';
import 'package:provider/provider.dart';
import '../../Conest/colore.dart';
import '../../Widget/mainbuttom.dart';
import '../../model/usermodel.dart';
import '../Product/productscreen.dart';
class LogIn extends StatefulWidget {
  bool isloding=false;
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  GlobalKey<FormState> _mykey = GlobalKey();
  user ?I=user();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        padding: EdgeInsets.all(20),
        child: Form(
          key: _mykey,
          child: Consumer<auth>(
            builder: (context, value, child) => SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Log \n     In",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: MyColore.primery,
                            fontSize:
                            MediaQuery.of(context).size.height *
                                0.08),
                      ),
                    ],
                  ),
                 Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            InputText(title: "userName",subtitle: "userName",onchang: (val){
                              I!.name=val;
                            },
                            ),
                            SizedBox(height: 20,),
                            InputText(title: "password",subtitle: "password",onchang: (val){
                              I!.pass=val;
                            },),
                            SizedBox(height: 60,),

                          ],),
                      ),
                  ),
                  MainButtom(titel: "Login",function: ()async{
                    if (!_mykey.currentState!.validate()) {
                      return null;
                    }
                    _mykey.currentState!.save();
                    try{
                     setState(() {
                       widget.isloding=true;
                     });
                      await value.login(I!.name!, I!.pass!);
                      setState(() {
                        widget.isloding=false;
                      });
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => MyProduct()));
                    }catch(e){
                      setState(() {
                        widget.isloding=false;
                      });
                      showDialog(
                          barrierDismissible: false,
                          context: context, builder: (context)=>MyDialog(error: e.toString(),),
                      );

                    }

                  },),
                  SizedBox(
                    height: 60,
                  ),
                  ButtomSheet(
                    title1: "Dont have an account ?",
                    title2: "Create one",
                    function: ()=>Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>SinUp())),),
                ],
              ),
            ),
          ),
        ),
      ),)
    );
  }
}
