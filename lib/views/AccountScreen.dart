import 'package:flutter/material.dart';
import 'package:whatsapp_ui/views/WhatsappHome.dart';
import 'dart:async';

class AccountScreen extends StatefulWidget {

  @override
  _AccountScreenState createState()=>new _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("Account"),),
        body: new Scaffold(

          body: new ListView(
              children: <Widget>[ new Column(
                children: <Widget>[

                  new ListTile(title: new Text("Change Your Number"),leading: new Icon(Icons.phone_android,color:Colors.black),
                    onTap: (){
                      print("logged out");
                      _rootPage();
                    },),
                  new ListTile(title: new Text("Delete Your Account"),leading: new Icon(Icons.delete_outline,color:Colors.black),),
                  new ListTile(title: new Text("Terms & Conditions"),leading: new Icon(Icons.business_center,color:Colors.black),)

                ],
              ) ]),
        )
    );
  }
  Future _rootPage(){
    return Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new WhatsappHome()));
  }
}

