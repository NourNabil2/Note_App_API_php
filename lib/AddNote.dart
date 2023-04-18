import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/HttpHelper.dart';
import 'package:note_app/homeScreen.dart';

import 'component.dart';
import 'links.dart';
import 'main.dart';

class Add_Note extends StatefulWidget {
  const Add_Note({Key? key}) : super(key: key);

  @override
  State<Add_Note> createState() => _AddNoteState();
}

class _AddNoteState extends State<Add_Note> with Http{
  void initState() {
    key2;
    // TODO: implement initState
    super.initState();
  }
  static var key2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final TextEditingController title = TextEditingController();
    final TextEditingController contact =  TextEditingController();
    AddNote() async
    {
      var response = await postdata(add, {
        'note_title': title.text,
        'note_content': contact.text,
        'note_users': share.getString('id'),
      });
      if (response['status'] == 'success') {
        print('object');
        print('${title.text}');
      }

    }
    return Scaffold(
      body:  Form(
        key: key2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              defaultFormField(controller: title, type: TextInputType.text, lable: 'Title', icon: Icons.title, valid: (value){
                if (value.isEmpty)
                {
                  return ('Title must not be empty !!');
                }
                return null;
              },),
              SizedBox(height: 15,),
              defaultFormField(controller: contact, type: TextInputType.text, lable: 'Your Note', icon: Icons.note_add, valid:  (value){
                if (value.isEmpty)
                {
                  return ('Note must not be empty !!');
                }
                return null;
              },),
              TextButton(onPressed: (){
                if (key2.currentState!.validate())
                  {
                    AddNote();
                  }

                }, child: Text('Add Note',style: TextStyle(color: Colors.purple,backgroundColor: Colors.transparent),),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.transparent)),)
            ],
          ),
        ),
      ),
    );
  }
}
