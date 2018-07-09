import 'package:flutter/material.dart';
import 'package:whatsapp_ui/views/WhatsappHome.dart';
import '../models/chat_model.dart';
class StatusScreen extends StatefulWidget {

  @override
  _StatusScreenState createState() => new _StatusScreenState();

}
class _StatusScreenState extends State<StatusScreen>{
  List<DataModel> statuses = new List();

  @override
  void initState() {
    super.initState();
    dummyDataChat.forEach((e){
      statuses.add(e);
    });
    statuses.sort((a,b)=>a.time.compareTo(b.time));
    DataModel myStatus = statuses[statuses.indexWhere((e)=>e.senderName==WhatsappHome.myNumber)];
    statuses.remove(myStatus);
    statuses.insert(0, myStatus);
  }
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
          itemCount: statuses.length,
          itemBuilder: (context,index) => new Column(
            children: <Widget>[
              new Divider(height: 10.0),
              new ListTile(
                leading: new CircleAvatar(backgroundImage:new NetworkImage(statuses[index].avatarUrl),backgroundColor: Colors.grey,radius: 25.0,),
                title: new Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                    children: <Widget>[
                      new Text(statuses[index].senderName,style: new TextStyle(fontWeight: FontWeight.bold),)]
                ),
                subtitle: new Text(statuses[index].time,style: new TextStyle(color: Colors.grey, fontSize: 14.0)),
              )

            ],
          )
    );
  }
@override
  void dispose() {
    statuses.clear();
    super.dispose();
  }

}