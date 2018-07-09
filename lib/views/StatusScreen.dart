import 'package:flutter/material.dart';
import '../models/chat_model.dart';
class StatusScreen extends StatefulWidget {

  @override
  _StatusScreenState createState() => new _StatusScreenState();

}
class _StatusScreenState extends State<StatusScreen>{
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
          itemCount: dummyDataChat.length,
          itemBuilder: (context,index) => new Column(
            children: <Widget>[
              new Divider(height: 10.0),
              new ListTile(
                leading: new CircleAvatar(backgroundImage:new NetworkImage(dummyDataChat[index].avatarUrl),backgroundColor: Colors.grey,radius: 25.0,),
                title: new Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                    children: <Widget>[
                      new Text(dummyDataChat[index].senderName,style: new TextStyle(fontWeight: FontWeight.bold),)]
                ),
                subtitle: new Text(dummyDataChat[index].time,style: new TextStyle(color: Colors.grey, fontSize: 14.0)),
              )

            ],
          )
    );
  }

}