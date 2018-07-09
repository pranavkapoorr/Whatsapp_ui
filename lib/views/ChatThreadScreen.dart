import 'dart:async';
import 'package:flutter/material.dart';
import '../models/chat_model.dart';


var myNum;
class ChatThreadScreen extends StatefulWidget {
  final ChatThread chatThread;
  final List chats;
  final String myNumber;

  ChatThreadScreen({Key key, @required this.chatThread, this.chats, this.myNumber}) : super(key: key){
    myNum = myNumber;
  }

  @override
  _ChatThreadScreenState createState() => new _ChatThreadScreenState();

}

class _ChatThreadScreenState extends State<ChatThreadScreen> {
  final TextEditingController _textController = new TextEditingController();
  Stream stream = Stream.fromIterable(dummyDataChat);
  bool _isComposing = false;
  List<ChatMessageBubble> messages = new List();

  @override
  void initState() {
    super.initState();
    dummyDataChat.forEach((e){
      if(e.senderName == widget.myNumber && e.receiverName == widget.chatThread.name || e.receiverName == widget.myNumber && e.senderName == widget.chatThread.name ) {
        messages.add(new ChatMessageBubble(
            sender: e.senderName, message: e.message, time: e.time));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: new AppBar(
        titleSpacing: 1.0,
        title: new Row(
          children: <Widget>[
            new IconButton(icon: new CircleAvatar(
              backgroundImage: new NetworkImage('${widget.chatThread.image}'),
              radius: 15.0,), onPressed: (){},),
            new Padding(padding: new EdgeInsetsDirectional.only(end: 10.0)),
            new GestureDetector(
              child: new Text('${widget.chatThread.name}'),
              onTap: (){},
            ),
          ],
        ),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.phone), onPressed: (){}),
          new IconButton(icon: new Icon(Icons.more_vert), onPressed: (){})
        ],
        elevation: 4.0,
      ),
      body: new Container(
          child: new Column(
            children: <Widget>[
              new Flexible(
                child: new ListView.builder(
                  padding: new EdgeInsets.all(8.0),
                  reverse: true,
                  itemBuilder: (_, int index) => messages[index],
                  itemCount: messages.length,
                ),
              ),
              new Divider(height: 1.0),
              new Container(
                  decoration: new BoxDecoration(
                      color: Theme
                          .of(context)
                          .cardColor),
                  child: _buildTestComposer()
              ),
            ],
          ),
          decoration: Theme
              .of(context)
              .platform == TargetPlatform.iOS
              ? new BoxDecoration(
              border: new Border(top: new BorderSide(color: Colors.grey[200])))
              : null), //new
    );
  }

  Widget _buildTestComposer() {
    return new IconTheme(
        data: new IconThemeData(color: Theme
            .of(context)
            .accentColor),
        child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(
              children: <Widget>[
                new Container(
                  margin: new EdgeInsets.symmetric(horizontal: 4.0),
                  child: new IconButton(
                      icon: new Icon(Icons.photo_camera,color: Colors.grey,),
                      onPressed: (){}),
                ),
                new Flexible(
                  child: new TextField(
                    controller: _textController,
                    onChanged: (String text) {
                      setState(() {
                        _isComposing = text.length > 0;
                      });
                    },
                    onSubmitted: _isComposing
                        ? _handleSubmitted
                        : null,
                    decoration:
                    new InputDecoration.collapsed(hintText: "Send a message"),
                  ),
                ),
                new Container(
                  margin: new EdgeInsets.symmetric(horizontal: 4.0),
                  child: new IconButton(
                    icon: new Icon(Icons.send),
                    onPressed: _isComposing
                        ? () => _handleSubmitted(_textController.text)
                        : null,),
                ),
              ]
          ),
        )
    );
  }

  void _handleSubmitted(String message) {
    setState(() {
      _isComposing = false;
    });
    DateTime time = new DateTime.now();
    String hrs = time.hour.toString();
    String mins = time.minute.toString();
    String timeX =  hrs + ":" + mins ;
    setState(() {
      messages.insert(0,new ChatMessageBubble(sender: widget.myNumber,message: message,time: timeX,));
    });
    _textController.clear();
  }
  @override
  void dispose(){
    messages.clear();
    _textController.dispose();
    super.dispose();
  }
}

@override
class ChatMessageBubble extends StatelessWidget {
  final String sender;
  final String message;
  final String time;
  ChatMessageBubble({this.sender, this.message, this.time});

  String getTime(){
    return this.time;
  }
  Widget build(BuildContext context) {
      final bg = sender!=myNum? Colors.white : Colors.greenAccent.shade100;
      final align = sender!=myNum ? CrossAxisAlignment.start : CrossAxisAlignment.end;
      final radius = sender!=myNum
          ? BorderRadius.only(
        topRight: Radius.circular(5.0),
        bottomLeft: Radius.circular(10.0),
        bottomRight: Radius.circular(5.0),
      )
          : BorderRadius.only(
        topLeft: Radius.circular(5.0),
        bottomLeft: Radius.circular(5.0),
        bottomRight: Radius.circular(10.0),
      );
     return Padding(
       padding: const EdgeInsetsDirectional.only(start: 2.0,end: 2.0),
       child: Column(
        crossAxisAlignment: align,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(3.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: .5,
                    spreadRadius: 1.0,
                    color: Colors.black.withOpacity(.12))
              ],
              color: bg,
              borderRadius: radius,
            ),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 48.0),
                  child: Text(message),
                ),
                Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  child: Row(
                    children: <Widget>[
                      Text(time,
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 10.0,
                          )),
                      SizedBox(width: 3.0),
                      sender==myNum?Icon(
                        Icons.done,
                        size: 12.0,
                        color: Colors.black38,
                      ):SizedBox(width: 0.1,)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
    ),
     );
  }
}


class ChatThread {
  final String name;
  final String image;
  ChatThread({this.name,this.image});
}