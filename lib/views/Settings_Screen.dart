import 'package:flutter/material.dart';
import 'package:whatsapp_ui/models/chat_model.dart';
import 'package:whatsapp_ui/views/WhatsappHome.dart';
import 'AccountScreen.dart';
import 'NotificationScreen.dart';
import 'dart:async';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => new _SettingsScreenState();

}

class _SettingsScreenState extends State<SettingsScreen>{

  @override
  Widget build(BuildContext context) {
    var myDetailTile = new Column(
          children: <Widget>[
            new Divider(
              height: 10.0,
            ),
            new ListTile(
              leading: new CircleAvatar(
                foregroundColor: Theme
                    .of(context)
                    .primaryColor,
                radius: 28.0,
                backgroundColor: Colors.grey,
                backgroundImage: new NetworkImage(
                    dummyDataChat[0].senderName==WhatsappHome.myNumber?dummyDataChat[0].avatarUrl:"https://i.pinimg.com/736x/34/77/c3/3477c3b54457ef50c2e03bdaa7b3fdc5.jpg"),
              ),
              title: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    WhatsappHome.myNumber,
                    style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
                  ),
                ],
              ),
              subtitle: new Container(
                padding: const EdgeInsets.only(top: 5.0),
                child: new Text(
                  "Hi there I  am using Whatsapp!",
                  style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                ),
              ),
              onTap: () {
              },
            )
          ],
        );
    return new Scaffold(
      appBar: new AppBar(title: new Text("Settings"),),
      body: new Scaffold(
        body: new ListView(
           children: <Widget>[ new Column(
              children: <Widget>[
                myDetailTile,
                new Divider(height: 1.0,color: Colors.black,),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start:20.0,top: 20.0),
                  child: new ListTile(title: new Text("Account"),leading: new Icon(Icons.vpn_key,color:Colors.black),onTap: _accountPage,),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start:20.0),
                  child: new ListTile(title: new Text("Notifications"),leading: new Icon(Icons.notifications,color:Colors.black),onTap: _notificationsPage,),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start:20.0),
                  child: new ListTile(title: new Text("Help"),leading: new Icon(Icons.help,color:Colors.black),onTap:(){}),
                )

              ],
            )]),
        )
    );
  }
  Future _accountPage(){
    return Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new AccountScreen()));
  }
  Future _notificationsPage(){
    return Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new NotificationScreen()));
  }


}

