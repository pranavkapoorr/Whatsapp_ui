import 'package:flutter/material.dart';
import 'WhatsappHome.dart';
import '../models/chat_model.dart';
class CallsScreen extends StatefulWidget {

  @override
  _CallsScreenState createState() => new _CallsScreenState();

}
class _CallsScreenState extends State<CallsScreen>{
  List<DataModel> calls = new List();

  @override
  void initState() {
    super.initState();
    dummyDataChat.forEach((e){
      if(e.senderName!=WhatsappHome.myNumber){
        calls.add(e);
      }
    });
    calls.sort((a,b)=>a.time.compareTo(b.time));
  }
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: calls.length,
        itemBuilder:(context, index) => new Column(children: <Widget>[
          index!=0?new Divider(
            indent: 85.0,
            height: 0.0,
          ):new Container(width: 0.0,height: 0.0,),
          new ListTile(
            leading: new CircleAvatar(backgroundColor: Colors.grey,foregroundColor: Colors.transparent,
                backgroundImage: new NetworkImage(calls[index].avatarUrl) ,radius: 25.0),
            title: new Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                children: <Widget>[
                  new Text(calls[index].senderName,style: new TextStyle(fontWeight: FontWeight.bold),)]
            ),
            subtitle: new Text(calls[index].time,style: new TextStyle(color: Colors.grey, fontSize: 14.0)),
            trailing: new Icon(Icons.phone),
          )


        ],),
      );
  }
@override
  void dispose() {
    calls.clear();
    super.dispose();
  }
}