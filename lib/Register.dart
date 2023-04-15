import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/homeScreen.dart';
import 'package:note_app/login.dart';

import 'HttpHelper.dart';
import 'component.dart';
import 'links.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Http http = Http();
    var key = GlobalKey<FormState>();
    var email = TextEditingController();
    var username = TextEditingController();
    var passsword = TextEditingController();
    signup() async {
     var response = await http.postdata(sign,
      {

          'username':username.text,
          'email':email.text,
          'password':passsword.text,

      });
     if (response['status']=='success')
       {
         Navigator.of(context).pushAndRemoveUntil( MaterialPageRoute(builder: (context) => home(),), (route) => false);
       }


    }

    return Scaffold(

      body:ListView(

        children: [
          Form(
              key: key,
              child:   Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    defaultFormField(controller: username , type: TextInputType.text, lable: 'UserName', icon: Icons.person_outline_outlined, onChange: null, onFieldSubmitted: null, valid: (value)
                    {
                      if (value.isEmpty)
                      {
                        return ('Email must not be empty !!');
                      }
                      return null;
                    },),
                    SizedBox(height: 15,),
                    defaultFormField(controller: email , type: TextInputType.emailAddress, lable: 'Email', icon: Icons.email_outlined, onChange: null, onFieldSubmitted: null, valid: (value)
                    {
                      if (value.isEmpty)
                      {
                        return ('Email must not be empty !!');
                      }
                      return null;
                    },),
                    SizedBox(height: 15,),
                    defaultFormField(controller: passsword , type: TextInputType.emailAddress, lable: 'Email', icon: Icons.remove_red_eye, onChange: null, onFieldSubmitted: null, valid: (value)
                    {
                      if (value.isEmpty)
                      {
                        return ('Email must not be empty !!');
                      }
                      return null;
                    },),
                    SizedBox(height: 15,),
                    TextButton(onPressed: ()async {
if (key.currentState!.validate())
  {
    await signup();
  }


                      }, child: Text('Sign Up',style: TextStyle(color: Colors.white,),),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.purple)),),
                    SizedBox(height: 20,),
                    Row(crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ Text('have an account?'),
                        TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));}, child: Text('Login NOW',style: TextStyle(color: Colors.purple,backgroundColor: Colors.transparent),),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.transparent)),)
                      ],),


                  ],
                ),
              ))

        ],

      )
      ,
    );

  }
}
