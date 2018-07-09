import 'package:whatsapp_ui/views/WhatsappHome.dart';

import '../models/chat_model.dart';
import 'package:flutter/material.dart';
import 'ChatThreadScreen.dart';
import 'ContactsUsingScreen.dart';


class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => new _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool hasLoaded = true;
  String _myNumber = WhatsappHome.myNumber;
  List _chatters = new List();
  Map<String,String> userMap =  new Map();
  List<Map<String,dynamic>> _chat = new List();
  Map<String,Map<String,String>> _lastMessage = new Map();

  @override
  void initState() {
    super.initState();
    dummyDataChat.forEach((e){
      if(e.senderName!=_myNumber) {
        _chatters.add(e.senderName);
        _lastMessage[e.senderName] = {e.time: e.message};
        userMap[e.senderName] = e.avatarUrl;
      }
    });
    _chatters.sort((a,b)=>_lastMessage[a].keys.toList()[0].compareTo(_lastMessage[b].keys.toList()[0]));
  }




  @override
  Widget build(BuildContext context) {
      return _chatters.length==0?new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new FlatButton(
                  onPressed:(){ Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>new ContactsUsingScreen(_myNumber,)));},
                  color: Colors.grey,child: new Text("Start New Conversation"),
                  splashColor: Colors.amber,)
              ],)
        ):chats();
    }


  Widget chats(){
    //_chatters = _chatters.toSet().toList();
   // _chatters.sort((a,b)=>_lastMessage[b].keys.toList()[0].compareTo(_lastMessage[a].keys.toList()[0]));
    return ListView.builder(
      itemCount: _chatters.length,
      itemBuilder: (context, i) =>
      new Column(
        children: <Widget>[
          new Divider(
            height: 10.0,
          ),
          new ListTile(
            leading: new CircleAvatar(
              foregroundColor: Theme
                  .of(context)
                  .primaryColor,
              backgroundColor: Colors.grey,
              backgroundImage: new NetworkImage(
                  userMap[_chatters[i]]==null?"https://i.pinimg.com/736x/34/77/c3/3477c3b54457ef50c2e03bdaa7b3fdc5.jpg":userMap[_chatters[i]]),
            ),
            title: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  _chatters[i],
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
                new Text(
                  _lastMessage[_chatters[i]].keys.toList()[0],
                  style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                ),
              ],
            ),
            subtitle: new Container(
              padding: const EdgeInsets.only(top: 5.0),
              child: new Text(
                _lastMessage[_chatters[i]].values.toList()[0],
                style: new TextStyle(color: Colors.grey, fontSize: 15.0),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new ChatThreadScreen(
                    chatThread: new ChatThread(
                        name: _chatters[i],
                        image: userMap[_chatters[i]]),
                    myNumber: _myNumber,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _lastMessage.clear();
    _chat.clear();
    _chatters.clear();
    super.dispose();
  }
}