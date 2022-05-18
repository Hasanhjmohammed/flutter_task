import 'package:flutter/material.dart';
import 'package:flutter_task/api/auth.dart';

import '../../Widget/inputtext.dart';
import '../../model/usermodel.dart';

class MulityInput extends StatelessWidget {
  user ?I=user();
  MulityInput({required this.I});
  @override
  Widget build(BuildContext context) {
    return Card(
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(8),
        child:SingleChildScrollView(
          child:  Column(children: [
            InputText(title: "userName",subtitle: "userName",onchang: (val){
              I!.name=val;
              print(I!.name);
            },
            ),
            SizedBox(
              height: 20,
            ),
            InputText(title: "password",subtitle: "password",
                onchang: (val){
                  I!.pass=val;
                  print(I!.pass);
                }),
            SizedBox(
              height: 20,
            ),
            InputText(title: "FullName",subtitle: "FullName",
                onchang: (val){
                  I!.full=val;
                }),
            SizedBox(
              height: 20,
            ),
            InputText(title: "phoneNamber",subtitle: "phoneNamber",
                onchang: (val){
                  I!.phone=val;
                }),
            SizedBox(
              height: 10,
            ),
            InputText(title: "City",subtitle: "City",onchang: (val){
              I!.city=val;
              print(I!.city);
            },
            ),
            SizedBox(
              height: 20,
            ),
          ]),
        )
      ),
    );
  }
}
