import 'package:flutter/material.dart';
class MyDialog extends StatelessWidget {
  String ?error;
  MyDialog({this.error});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Error"),
      content: Container(
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [Text("$error           "),
            TextButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: Text("OK",textAlign: TextAlign.right,)),
          ],

        ),
      ),
    );
  }
}
