
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
    key1;
    // TODO: implement initState
    super.initState();
  }
  static var key1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {


    final TextEditingController email = new TextEditingController();
    final TextEditingController passsword = new TextEditingController();
    Login() async {
      var response = await Http.postdata(login,
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
          // AwesomeDialog(
          //   context: context,
          //   dialogType: DialogType.error,
          //   animType: AnimType.scale,
          //   title: 'invalid data',
          //   desc: 'Make sure that Email and Password correct',
          //   btnOkOnPress: (){},
          // ).show();
        }


    }
    return Scaffold(

      body:ListView(

        children: [
          Form(
              key: key1,
              child:   Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('images/Login.jpg'),
              SizedBox(height: 15,),
                defaultFormField(controller: email ,ontap: () => FocusScope.of(context).hasPrimaryFocus, type: TextInputType.emailAddress, lable: 'Email', icon: Icons.email_outlined, valid: (value)
                {
                  if (value.isEmpty)
                  {
                    return ('Email must not be empty !!');
                  }
                  return null;
                },),
                const SizedBox(height: 15,),
                defaultFormField(controller: passsword , type: TextInputType.emailAddress, lable: 'Password', icon: Icons.remove_red_eye, valid: (value)
                {
                  if (value.isEmpty)
                  {
                    return ('Password must not be empty !!');
                  }
                  return null;
                },),
              const SizedBox(height: 15,),
              TextButton(onPressed: ()async {
                if (key1.currentState!.validate())
                {
                  await Login();
                }


              }, child:const  Text('LOGIN',style: TextStyle(color: Colors.white,),),style: ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(700, 20)),backgroundColor: MaterialStatePropertyAll(Colors.purple)),),

              const SizedBox(height: 15,),

              Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ const Text('Don\'t have an account?'),
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
