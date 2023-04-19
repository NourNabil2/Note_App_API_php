import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/HttpHelper.dart';

import 'component.dart';
import 'links.dart';

class Edit_node extends StatefulWidget {
  final note;
  const Edit_node({Key? key,this.note}) : super(key: key);

  @override
  State<Edit_node> createState() => _Edit_nodeState();
}

class _Edit_nodeState extends State<Edit_node> with Http {

  static var key2 = GlobalKey<FormState>() ;
  final TextEditingController title = TextEditingController();
  final TextEditingController contact =  TextEditingController();
  EditNote() async
  {
    var response = await postdata(edit, {
      'note_title': title.text,
      'note_content': contact.text,
      'note_id': widget.note['note_id'].toString(),
    });
    if (response['status'] == 'success') {
      print('object');
      print('${title.text}');
    }

  }
  void initState() {
    title.text = widget.note['note_title'];
    contact.text = widget.note['note_content'];
    key2;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

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
                  EditNote();
                }

              }, child: Text('Edit',style: TextStyle(color: Colors.purple,backgroundColor: Colors.transparent),),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.transparent)),)
            ],
          ),
        ),
      ),
    );
  }
}
