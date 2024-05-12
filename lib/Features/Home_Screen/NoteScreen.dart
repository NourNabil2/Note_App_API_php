import 'dart:math';
import 'dart:ui';
import 'package:note_app/Core/Utilts/colors.dart';
import 'package:note_app/Features/Home_Screen/homeScreen.dart';
import 'package:on_popup_window_widget/on_popup_window_widget.dart';
import '../EditNote.dart';
import '../../Core/Networks/HttpHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Core/Networks/links.dart';
import '../../main.dart';

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);
  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {


  getAllNote() async
  {
    var respone = await Http.postdata(view, {
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
                  Center(child: Image(image: AssetImage('images/empty.gif'),width: 200, )),
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
    return TextButton(
      onLongPress: (){
        showDialog(
            context: context,
             builder: (BuildContext context) => OnPopupWindowWidget(
                 title: const Text("Do you want to delete this message!"),
                 child:  Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     TextButton(onPressed: () async {
                       await Http.postdata(Delete, {
                         'id' :  snapshot.data['data'][index]['note_id'].toString(),
                         'imagename' :snapshot.data['data'][index]['note_image'],
                       });
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const home(),));
                     }, child: Text('delete',style: TextStyle(color: ColorApp.ButtonColor,fontWeight: FontWeight.bold,fontSize: 20),)),
                     SizedBox(width: 50,),
                     TextButton(onPressed: () {
                       Navigator.pop(context);
                     }, child: Text('cancel',style: TextStyle(color: ColorApp.ButtonColor,fontWeight: FontWeight.bold,fontSize: 20),)),
                   ],
                 )
                     ),
        );
      },
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Edit_node(note:snapshot.data['data'][index] ),));
      },
      child: Container(
        decoration: BoxDecoration(color: ColorApp.TextFieldColor,borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(18),

        child:
        Row(children:
        [
         if (snapshot.data['data'][index]['note_image'] != '')Image.network('$Upload/${snapshot.data['data'][index]['note_image']}' ,width: 50),
          if (snapshot.data['data'][index]['note_image'] == '')Text('NOTE $index',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),

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
        return Center(child: Text('No Networke'));
      },
    );




  }
}














