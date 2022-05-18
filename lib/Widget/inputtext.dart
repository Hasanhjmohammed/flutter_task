import 'package:flutter/material.dart';
import 'package:flutter_task/Conest/colore.dart';
class InputText extends StatefulWidget {
  String ?title;
  String ?subtitle;
  FormFieldValidator<String>?validator;
  ValueChanged<String>?onchang;
  InputText({this.title,this.subtitle,this.validator,this.onchang});

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (val){
        print(val);
      },
      onChanged:widget.onchang,
      keyboardType:widget.title=="phoneNamber" ?TextInputType.phone:TextInputType.text,
      validator: (val){
        if(val!.isEmpty)
        {  return "please fill this feil";}
        return null;
      },
//      onSaved: widget._save,
//      onChanged: (val){
//      },

      decoration: InputDecoration(
focusedBorder: UnderlineInputBorder(
borderSide: BorderSide(
  color: MyColore.primery,
)
),
        labelStyle: TextStyle(
          color: MyColore.primery.withOpacity(0.6),
        ),
        hintStyle: TextStyle(
          color: MyColore.primery.withOpacity(0.2),
        ),
        hintText: "${widget.title}",
        labelText: "${widget.subtitle}",

      ),

    );
  }
}
