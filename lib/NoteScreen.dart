import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    List colors = [Colors.grey[700], Colors.brown, Colors.greenAccent];
    Random random = new Random();

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: 20,
      itemBuilder: (context, index) {
        return MaterialButton(
          onPressed: () { },
          child: Container(
            decoration: BoxDecoration(color: colors[random.nextInt(3)],borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(18),

            child: Row(children: [Text('data'),
            SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('title',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold )),
                Text('contact', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold ),overflow: TextOverflow.ellipsis,maxLines: 1,textAlign: TextAlign.center,),
              ]

              ,)
          ]
          ),
          ),
        );
      }, separatorBuilder: (BuildContext context, int index) { return Padding(padding: EdgeInsets.all(8)) ;},
    );


  }
}
