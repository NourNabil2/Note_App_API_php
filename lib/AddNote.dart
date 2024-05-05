import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:note_app/HttpHelper.dart';
import 'component.dart';
import 'links.dart';
import 'main.dart';

class Add_Note extends StatefulWidget {
  const Add_Note({Key? key}) : super(key: key);

  @override
  State<Add_Note> createState() => _AddNoteState();
}

class _AddNoteState extends State<Add_Note>{
  void initState() {
    key2;
    k;
    // TODO: implement initState
    super.initState();
  }
  static var key2 = GlobalKey<FormState>();
  static var k = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final TextEditingController title = TextEditingController();
    final TextEditingController contact =  TextEditingController();
    File? myfile ;
    AddNote() async
    {
      // if (myfile == null )
      //   return AwesomeDialog(context: context ,title: 'no image')..show();
      var response = await Http.postFile(add, {
        'note_title': title.text,
        'note_content': contact.text,
        'note_users': share.getString('id'),

      },myfile!);
      if (response['status'] == 'success') {
        print('object');
        print('${title.text}');
      }

    }
    return Scaffold(
      key: k,
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
              defaultFormField2(controller: contact,type: TextInputType.text, lable: 'Your Note', icon: Icons.note_add, valid:  (value){
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

                }, child: Text('Add Note',style: TextStyle(color: Colors.purple,backgroundColor: Colors.transparent),),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.transparent)),),
              TextButton(onPressed: (){
                k.currentState?.showBottomSheet((context) => Container(width: double.infinity,height: 200,color: Colors.grey,child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(

      child: Text('Open Camera'),
      onTap: () async {
        XFile? xf = await ImagePicker().pickImage(source: ImageSource.camera) ;
        myfile = File(xf!.path);
      },
    ),
        SizedBox(height: 20,),
        InkWell(

      child: Container(child: Text('import from galary')),
      onTap: () async {
        XFile? xf = await ImagePicker().pickImage(source: ImageSource.gallery) ;
        myfile = File(xf!.path);
      },
    ),
      ],
    )),);


                }, child: Text('Add Image',style: TextStyle(color: Colors.purple,backgroundColor: Colors.transparent),),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.transparent)),),
            ],
          ),
        ),
      ),
    );
  }
}
