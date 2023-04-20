import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:note_app/homeScreen.dart';
import 'EditNote.dart';
import 'HttpHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'links.dart';
import 'main.dart';

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);
  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {

  Http http = Http();
  getAllNote() async
  {
    var respone = await http.postdata(view, {
      'id' : share.getString('id'),
    });
    return respone;
  }

  void initState()
  {

     Notes s = Notes();
    super.initState();
  }

@override

  @override
  Widget build(BuildContext context) {
    List colors = [Colors.grey[700], Colors.teal, Colors.blueGrey];
    Random random = new Random();

    return FutureBuilder(
      future: getAllNote() ,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData)
        {
          if (snapshot.data['status'] == 'fail')
            {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Image(image: AssetImage('images/empty.gif'),width: 300, )),
                  Text('No Notes Yet',style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              );
            }
return  ListView.separated(

  physics: BouncingScrollPhysics(),
  shrinkWrap: true,
  scrollDirection: Axis.vertical,
  itemCount:  snapshot.data['data'].length,
  itemBuilder: (context, index) {
    return MaterialButton(
      onLongPress: (){
        AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            animType: AnimType.scale,
            title: 'Delete Note',
            desc: 'You will Delete this Note',
            btnCancelOnPress: () {},
            btnOkOnPress: () async {
                await http.postdata(Delete, {
                  'id' :  snapshot.data['data'][index]['note_id'].toString(),
                });
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => home(),));
            },
        )..show();
      },
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Edit_node(note:snapshot.data['data'][index] ),));
      },
      child: Container(
        decoration: BoxDecoration(color: colors[random.nextInt(3)],borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(18),

        child: Row(children: [Text('NOTE $index'),
          SizedBox(width: 15,),
          Expanded(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text('${snapshot.data['data'][index]['note_title']}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold ,overflow: TextOverflow.ellipsis,),maxLines: 1,),
                Text('${snapshot.data['data'][index]['note_content']}', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis,),maxLines: 2,textAlign: TextAlign.center,),
              ]

              ,),
          )
        ]
        ),
      ),
    );

  }, separatorBuilder: (BuildContext context, int index) { return Padding(padding: EdgeInsets.all(8)) ;},
);
        }
        if (snapshot.connectionState == ConnectionState.waiting)
        {
          return Center(child: Text('Loading...'));
        }
        return Center(child: Text('not working'));
      },
    );




  }
}














