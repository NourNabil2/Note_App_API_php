
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:note_app/AddNote.dart';
import 'package:note_app/HttpHelper.dart';
import 'package:note_app/component.dart';
import 'package:note_app/main.dart';

import 'NoteScreen.dart';
import 'links.dart';
import 'login.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  
  void initState() {
    sk;
    key;
    showbottom;
    title;
    contact;
    // TODO: implement initState
    super.initState();
  }
  static var sk = GlobalKey<ScaffoldState>();
 static var key = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController contact =  TextEditingController();
  bool showbottom = true;
  @override

  Widget build(BuildContext context) {
    Http http = Http();


    final _advancedDrawerController = AdvancedDrawerController();

    AddNote() async
    {
        var response = await http.postdata(add, {
          'note_title': title.text,
          'note_content': contact.text,
          'note_users': share.getString('id'),
          'file' : '',
        });
        if (response['status'] == 'success') {
          print('object');
          print('${title.text}');
        }

    }
    void _handleMenuButtonPressed() {
      // NOTICE: Manage Advanced Drawer state through the Controller.
      // _advancedDrawerController.value = AdvancedDrawerValue.visible();
      _advancedDrawerController.showDrawer();
    }
    return AdvancedDrawer(
        backdropColor: Colors.blueGrey,
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
    animateChildDecoration: true,
    rtlOpening: false,
    // openScale: 1.0,
    disabledGestures: false,
    childDecoration: const BoxDecoration(
    // NOTICE: Uncomment if you want to add shadow behind the page.
    // Keep in mind that it may cause animation jerks.
    // boxShadow: <BoxShadow>[
    //   BoxShadow(
    //     color: Colors.black12,
    //     blurRadius: 0.0,
    //   ),
    // ],
    borderRadius: const BorderRadius.all(Radius.circular(16)),
    ), drawer: SafeArea(
      child: Container(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128.0,
                height: 128.0,
                margin: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 64.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'images/logo.png',
                ),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.home),
                title: Text('All note'),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Add_Note(),));
                },
                leading: Icon(Icons.add),
                title: Text('Add note'),
              ),
              ListTile(
                onTap: () {
                  share.clear();
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginScreen(),));

                },
                leading: Icon(Icons.exit_to_app),
                style:ListTileStyle.list ,
                iconColor: Colors.red[800],
                textColor: Colors.red[900],
                title: Text('Log Out'),
              ),
              Spacer(),
              DefaultTextStyle(
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: Text('Terms of Service | Privacy Policy | Nour Nabil'),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    child:  Scaffold(
      key: sk,
      body: Notes(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Note App',style: TextStyle(color: Colors.grey),),
        leading: IconButton(
          color: Colors.grey,
          onPressed: _handleMenuButtonPressed,
          icon: ValueListenableBuilder<AdvancedDrawerValue>(
            valueListenable: _advancedDrawerController,
            builder: (_, value, __) {
              return AnimatedSwitcher(
                duration: Duration(milliseconds: 250),
                child: Icon(
                  value.visible ? Icons.clear : Icons.menu,
                  key: ValueKey<bool>(value.visible),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(onPressed: () {
        if(showbottom)
        {
          sk.currentState?.showBottomSheet((context) => Container(color: Colors.black12, padding: EdgeInsets.all(20.0),
              child: Form(
                key: key,
                child: Column(
                  mainAxisSize:MainAxisSize.min,
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
                  ],
                ),
              ),
          )).closed.then((value) {
setState(() {
  showbottom=true;
});
            }  );

setState(() {
  showbottom = false ;
});

        }
        else {

          if (key.currentState!.validate()){
            setState(() {
              AddNote();
              showbottom = true ;
            });

            print('${title.text}');
            Navigator.pop(context);
            title.clear();
            contact.clear();

          }
        }
       },backgroundColor: Colors.grey,child: Icon(CupertinoIcons.add)),

    ),);



  }
}
