import 'package:flutter/material.dart';
import '../models/chat_model.dart';
class CallsScreen extends StatefulWidget {

  @override
  _CallsScreenState createState() => new _CallsScreenState();

}
class _CallsScreenState extends State<CallsScreen>{
  String _defaultImage = "https://i.pinimg.com/736x/34/77/c3/3477c3b54457ef50c2e03bdaa7b3fdc5.jpg";
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: dummyDataChat.length,
        itemBuilder:(context, index) => new Column(children: <Widget>[
          new Divider(height: 10.0),
          new ListTile(
            leading: new CircleAvatar(backgroundColor: Colors.grey,foregroundColor: Colors.transparent,
                backgroundImage: new NetworkImage(_defaultImage) ,radius: 25.0),
            title: new Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                children: <Widget>[
                  new Text(dummyDataChat[index].senderName,style: new TextStyle(fontWeight: FontWeight.bold),)]
            ),
            subtitle: new Text(dummyDataChat[index].time,style: new TextStyle(color: Colors.grey, fontSize: 14.0)),
            trailing: new Icon(Icons.phone),
          )


        ],),
      );
  }

}