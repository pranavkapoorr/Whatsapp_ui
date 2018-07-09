import 'package:flutter/material.dart';
import '../models/chat_model.dart';
import 'ChatThreadScreen.dart';
//import 'package:contacts_service/contacts_service.dart';

class ContactsUsingScreen extends StatefulWidget{
  final String myNumber;
  ContactsUsingScreen(this.myNumber);

  @override
  _ContactsUsingScreenState createState() => new _ContactsUsingScreenState();

}

class _ContactsUsingScreenState extends State<ContactsUsingScreen> {
  List<DataModel> _numbers = new List();
  bool loading = false;

  @override
  initState() {
    super.initState();
    loading = true;
    dummyDataChat.forEach((e){
      if(e.senderName!=myNum){
        _numbers.add(e);
      }
    });
    loading = false;
  }


  @override
  Widget build(BuildContext context) {
    if(loading){
      return new Scaffold(body: new Center(child: new CircularProgressIndicator(),));
    }else {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Start New Conversation",style: new TextStyle(color: Theme.of(context).accentColor),),
        ),
        body: new ListView.builder(
          itemCount: _numbers.length != null ? _numbers.length : 0,
          itemBuilder: (context, index) =>
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Divider(height: 0.7,),
              new ListTile(
                leading: new CircleAvatar(backgroundImage: new NetworkImage(_numbers[index].avatarUrl),),
                title: new Text(_numbers[index].senderName),
                onTap:() {
                    Navigator.push(
                    context,
                    new MaterialPageRoute(
                    builder: (context) => new ChatThreadScreen(
                      chatThread: new ChatThread(
                      name: _numbers[index].senderName,
                      image: _numbers[index].avatarUrl,),
                      myNumber: widget.myNumber,
                    ),
                    ),
                    );
                },
              ),
            ],
          ),
        ),
      );
    }
  }
}

