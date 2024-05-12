
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/Core/Utilts/colors.dart';
import 'package:note_app/Core/Utilts/constant.dart';
import 'package:note_app/Core/widgets/button.dart';
import 'package:note_app/Core/widgets/snackbar.dart';

import 'package:note_app/Features/Home_Screen/homeScreen.dart';
import 'package:note_app/Features/Auth_screens/login.dart';

import '../../Core/Networks/HttpHelper.dart';
import '../../Core/widgets/component.dart';
import '../../Core/Networks/links.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
@override

  void initState() {
    // TODO: implement initState
    key;
    super.initState();
  }
 GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Http http = Http();

    final email = TextEditingController();
    final username = TextEditingController();
    final passsword = TextEditingController();

    signup() async {
     var response = await Http.postdata(sign,
      {

          'username':username.text,
          'email':email.text,
          'password':passsword.text,

      });
     if (response['status']=='success')
       {
         showSnackBar(context, 'Success create new user');
         Navigator.of(context).pushAndRemoveUntil( MaterialPageRoute(builder: (context) => home(),), (route) => false);
       }
     else
       {
         showSnackBar(context, 'error');
       }


    }

    return Scaffold(
backgroundColor: ColorApp.background,
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
                    Image.asset(Appimage.sign),
                    SizedBox(height: 15,),
                    CustomFormTextField(controller: username ,  hintText: 'UserName', ),
                    SizedBox(height: 15,),
                    CustomFormTextField(controller: email , hintText: 'Email', ),
                    SizedBox(height: 15,),
                    CustomFormTextField(controller: passsword , hintText: 'Password', ),
                    SizedBox(height: 15,),
                    Button(text: 'sign up',onpress: ()async {
    if (key.currentState!.validate())
    {
    await signup();
    }},),
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
