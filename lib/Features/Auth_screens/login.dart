
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/Core/Utilts/colors.dart';
import 'package:note_app/Core/Utilts/constant.dart';
import 'package:note_app/Core/widgets/button.dart';
import 'package:note_app/main.dart';
import '../../Core/Networks/HttpHelper.dart';
import '../../Core/widgets/snackbar.dart';
import 'Register.dart';
import '../../Core/widgets/component.dart';
import '../Home_Screen/homeScreen.dart';
import '../../Core/Networks/links.dart';

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
          showSnackBar(context, 'password or email is incorrect');
        }

    }
    return Scaffold(
backgroundColor: ColorApp.background ,
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
              Image.asset(Appimage.booknote),
              Text('Note Saver', style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
              SizedBox(height: 30,),
              CustomFormTextField(controller: email,onChanged : (p0) => FocusScope.of(context).hasPrimaryFocus,  hintText: 'Email',),
                const SizedBox(height: 15,),
              CustomFormTextField(controller: passsword , hintText: 'Password', obscureText: true,),
              const SizedBox(height: 15,),
              Button(
                  onpress:  ()async {
                if (key1.currentState!.validate())
                {
                  await Login();
                }
              },
                  text: 'LOGIN',

              ),
              const SizedBox(height: 15,),
              Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ const Text('Don\'t have an account?'),
                TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Register(),));}, child: Text('REGISTER NOW',style: TextStyle(color: ColorApp.ButtonColor,backgroundColor: Colors.transparent),),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.transparent)),)
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
