
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
final maxLines = 5;
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

    maxLines: null,


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

      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple , width: 1.5)),
      prefixIcon: Icon( icon ,  color: Colors.black,) ,
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