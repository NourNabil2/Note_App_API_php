import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import 'NoteScreen.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _advancedDrawerController = AdvancedDrawerController();
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
                onTap: () {},
                leading: Icon(Icons.add),
                title: Text('Add note'),
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
      floatingActionButton: FloatingActionButton(onPressed: () {  },backgroundColor: Colors.grey,child: Icon(CupertinoIcons.add)),
    ),);



  }

}
