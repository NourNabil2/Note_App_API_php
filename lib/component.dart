
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    })=> Container(


  color: Colors.white,

  child:   TextFormField(

    autofocus: autofocus ,

    style: TextStyle(color: Colors.black),

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
    ) ,


  ),
);