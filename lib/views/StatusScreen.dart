import 'package:flutter/material.dart';
import 'WhatsappHome.dart';
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
              index!=0?new Divider(
                indent: 85.0,
                height: 0.0,
              ):new Container(width: 0.0,height: 0.0,),
              new ListTile(
                leading: new CircleAvatar(child:index==0?Stack(children:[Align(alignment: Alignment(1.0, 1.3),child:Icon(Icons.add_circle,color: Colors.green.shade600,))]):null,backgroundImage:new NetworkImage(statuses[index].avatarUrl),backgroundColor: Colors.white,maxRadius: index!=0?25.0:30.0,),
                title: new Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                    children: <Widget>[
                      new Text(index!=0?statuses[index].senderName:"My Status",style: new TextStyle(fontWeight: FontWeight.bold),)]
                ),
                subtitle: new Text(index!=0?statuses[index].time:"tap to add status",style: new TextStyle(color: Colors.grey, fontSize: 14.0)),
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