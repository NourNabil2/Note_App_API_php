import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'HttpHelper.dart';
import 'Register.dart';
import 'component.dart';
import 'homeScreen.dart';
import 'links.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    Http http = Http();
    var key = GlobalKey<FormState>();
    var email = TextEditingController();
    var passsword = TextEditingController();
    Login() async {
      var response = await http.postdata(login,
          {
            'email':email.text,
            'password':passsword.text,
          });
      if (response['status']=='success')
      {
        Navigator.of(context).pushAndRemoveUntil( MaterialPageRoute(builder: (context) => home(),), (route) => false);
      }
      else
        {
          AwesomeDialog(context: context ,title: "wrong Password or Emain" ,body: Text('please cheack the email and password') ) ;
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
                    return ('Password must not be empty !!');
                  }
                  return null;
                },),
              SizedBox(height: 15,),
              TextButton(onPressed: ()async {
                if (key.currentState!.validate())
                {
                  await Login();
                }


              }, child: Text('LOGIN',style: TextStyle(color: Colors.white,),),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.purple)),),

              SizedBox(height: 15,),

              Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ Text('Don\'t have an account?'),
                TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Register(),));}, child: Text('REGISTER NOW',style: TextStyle(color: Colors.purple,backgroundColor: Colors.transparent),),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.transparent)),)
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
