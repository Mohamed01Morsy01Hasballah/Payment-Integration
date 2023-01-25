
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget BuiltTextField(
    {
      required String label,
      required TextInputType  type,
      required TextEditingController controller,
      required IconData prefix,
      IconData? suffix,
      validate,
      bool secure=false,
      suffixPressed,
      Function? onsubmit,

    }
    )=> TextFormField(
    keyboardType: type,
    controller:controller ,
    obscureText: secure,
    onFieldSubmitted:(s){
      onsubmit!(s);
    } ,
    decoration: InputDecoration(
        labelText:label,

        prefixIcon: Icon(
            prefix
        ),
        suffixIcon: TextButton(
          onPressed:suffixPressed ,
          child: Icon(
              suffix
          ),
        ),
        border:OutlineInputBorder()
    ),
    validator: validate
);
Widget BuiltButton(
    {
      required double height,
      required Color color,
      required String text,
      required  Function function,
    }
    )=>
    Container(
      width: double.infinity,
      height: height,
      color: color,
      child: MaterialButton(
        onPressed:(){
          function();
        },
        child: Text(text.toUpperCase()),

      ),
    );
void navigatePush({
  required Widget widget,
  context
})=>Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
void navigateFininsh({
  Widget ,
  context
})=>
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context)=>Widget)
        ,(route) => false
    );
void ShowToast(
    {
      required String text,
      required ToastState state
    }
    )
{
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: ChooseColor(state),
      textColor: Colors.white,
      fontSize: 16.0
  );
}
enum ToastState{Success,Error,Warning}
Color? ChooseColor(ToastState state){
  Color? color;
  switch(state){
    case ToastState.Success:
      color=Colors.orange;
      break;
    case ToastState.Error:
      color=Colors.red;
      break;
    case ToastState.Warning:
      color=Colors.yellow;
  }

}