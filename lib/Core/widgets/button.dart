import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utilts/colors.dart';

Widget Button({required onpress,required String text })
{
 return Padding(
    padding:  EdgeInsets.all(8.0),
    child: TextButton(
      onPressed: onpress,
      style: const ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(700, 20)),
          backgroundColor: MaterialStatePropertyAll(ColorApp.ButtonColor)), child: Text( text ,style: const TextStyle(color: Colors.white,),),),
  );
}