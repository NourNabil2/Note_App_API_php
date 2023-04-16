import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/main.dart';
import 'HttpHelper.dart';
import 'Register.dart';
import 'component.dart';
import 'homeScreen.dart';
import 'links.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    key;
    // TODO: implement initState
    super.initState();
  }
  static var key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Http http = Http();

    final TextEditingController email = new TextEditingController();
    final TextEditingController passsword = new TextEditingController();
    Login() async {
      var response = await http.postdata(login,
          {
            'email':email.text,
            'password':passsword.text,
          });
      if (response['status']=='success')
      {
        share.setString('id', response['data']['id'].toString());
            
        Navigator.of(context).pushAndRemoveUntil( MaterialPageRoute(builder: (context) => home(),), (route) => false);
      }
      else
        {
          print('nooooo');
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
                defaultFormField(controller: email ,ontap: () => FocusScope.of(context).hasPrimaryFocus, type: TextInputType.emailAddress, lable: 'Email', icon: Icons.email_outlined, valid: (value)
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


              }, child: Text('LOGIN',style: TextStyle(color: Colors.white,),),style: ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(700, 20)),backgroundColor: MaterialStatePropertyAll(Colors.purple)),),

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
