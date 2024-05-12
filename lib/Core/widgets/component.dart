
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Utilts/colors.dart';
final maxLines = 5;

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({this.hintText, this.onChanged , this.obscureText =false, this.controller});
  Function(String)? onChanged;
  String? hintText;
  bool? obscureText;
  Icon? icon;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsetsDirectional.all(2),
        decoration: BoxDecoration(color: ColorApp.TextFieldColor,borderRadius: BorderRadius.circular(40)),
        child: TextFormField(
          controller: controller,
          cursorColor: Colors.black,
          style: Theme.of(context).textTheme.labelSmall,
          obscureText:obscureText!,
          validator: (data) {
            if (data!.isEmpty) {
              return '        field is required';
            }
          },
          onChanged: onChanged,
          decoration: InputDecoration(
            icon: icon,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.labelSmall,
            border: const OutlineInputBorder(
                borderSide: BorderSide.none
            ),
          ),
        ),
      ),
    );
  }
}

Widget defaultFormField (
    {

      @required controller,
      required TextInputType type ,
      required String lable,
      required IconData icon ,
      onChange,
      onFieldSubmitted ,
      required  valid ,
      IconData? icon2,
      press,
      ontap  ,
      onSubmitted,
      obscureText = false ,
      autofocus = false ,

      height,
    })=> Container(
  margin: EdgeInsets.all(12),
  color: Colors.white,

  child:   TextFormField(

    maxLines: 1,


    autofocus: autofocus ,

    style: TextStyle(color: Colors.black,),

    validator: valid,

    cursorColor: ColorApp.ButtonColor,
    onEditingComplete :onSubmitted,

    controller: controller,

    keyboardType: type ,

    onFieldSubmitted: onFieldSubmitted ,

    onChanged: onChange ,


    onTap: ontap ,

    obscureText: obscureText ,

    decoration:

    InputDecoration(

      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorApp.ButtonColor, width: 2)),
      prefixIcon: Icon( icon ,  color: ColorApp.ButtonColor,) ,
      hintText: lable,
      border: OutlineInputBorder(),
      //isDense: true,                      // Added this
      //contentPadding: EdgeInsets.all(8),
    ) ,


  ),
);


Widget defaultFormField2 (
    {

      @required controller,
      required TextInputType type ,
      required String lable,
      required IconData icon ,
      onChange,
      onFieldSubmitted ,
      required  valid ,
      IconData? icon2,
      press,
      ontap  ,
      onSubmitted,
      obscureText = false ,
      autofocus = false ,

      height,
    })=> Container(

  height: maxLines * 50.0,
  margin: EdgeInsets.all(12),
  color: Colors.white,

  child:   TextFormField(

    maxLines: maxLines * 50,

    autofocus: autofocus ,

    style: TextStyle(color: Colors.black,),

    validator: valid,

    cursorColor: Colors.deepPurpleAccent,
    onEditingComplete :onSubmitted,

    controller: controller,

    keyboardType: type ,

    onFieldSubmitted: onFieldSubmitted ,

    onChanged: onChange ,


    onTap: ontap ,

    obscureText: obscureText ,

    decoration:

    InputDecoration(
filled: true,
      focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
     // prefixIcon: Icon( icon ,  color: Colors.black,) ,
      hintText: lable,
      //border: OutlineInputBorder(),
     // isDense: true,                      // Added this
      //contentPadding: EdgeInsets.all(8),
    ) ,


  ),
);