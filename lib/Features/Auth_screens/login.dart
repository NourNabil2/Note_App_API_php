import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

    bool isloading = false ;
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    Login() async {
     var response = await Http.postdata(
        login,
        {
            'email':email.text,
            'password':password.text,
          }
          );
      if (response['status']=='success')
      {
        isloading = false ;
        showSnackBar(context, 'Wellcome Back');
        share.setString('id', response['data']['id'].toString());
        Navigator.of(context).pushAndRemoveUntil( PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => home(),transitionDuration: Duration(seconds: 2),), (route) => false);
      }
      else
        {
          isloading = false ;
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
              Hero(
                  tag: 'open',
                  child: Image.asset(Appimage.booknote)),
              Text('Note Saver', style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
              SizedBox(height: 30,),
              CustomFormTextField(controller: email,onChanged : (p0) => FocusScope.of(context).hasPrimaryFocus,  hintText: 'Email',),
                const SizedBox(height: 15,),
              CustomFormTextField(controller: password , hintText: 'Password', obscureText: true,),
              const SizedBox(height: 15,),
              isloading ? const CircularProgressIndicator(color: ColorApp.ButtonColor,):Button(
                  onpress:  () {
                if (key1.currentState!.validate())
                {

                    Login();


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
