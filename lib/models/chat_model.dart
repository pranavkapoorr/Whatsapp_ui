import 'package:meta/meta.dart';

class ChatMessageModel {
  ChatMessageModel({
    @required this.sender,
    @required this.receiver,
    @required this.message,
    @required this.timeStamp,
    @required this.id,
    this.synced,
  });
  String sender, id, receiver, message, timeStamp;
  bool synced;

  ChatMessageModel.fromJson(Map json)
      : id = json["id"].toString(),
        sender = json["sender"],
        receiver = json["receiver"],
        message = json["message"],
        timeStamp = json["timeStamp"],
        synced = json['synced'];

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    //map['id'] = id;
    map['sender'] = sender;
    map['receiver'] = receiver;
    map['message'] = message;
    map['timeStamp'] = timeStamp;
    map['synced'] = synced;
    return map;
  }
}
class User {
  User({
    @required this.name,
    @required this.number,
    @required this.dp,
    @required this.id,
    @required this.gender,
  });

  String name, number, id, dp, gender;


  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['number'] = number;
    map['id'] = id;
    map['dp'] = dp;
    map['name'] = name;
    map['gender'] = gender;
    return map;
  }
}



class DataModel {
  final String senderName;
  final String receiverName;
  final String message;
  final String time;
  final String avatarUrl;

  DataModel({this.senderName, this.message, this.time, this.avatarUrl,this.receiverName});
}

List<DataModel> dummyDataChat = [
  new DataModel(
      senderName: "Pranav Kapoor",
      message: "Hey there, You are so amazing !",
      time: "15:30",
      avatarUrl: "https://i.pinimg.com/736x/34/77/c3/3477c3b54457ef50c2e03bdaa7b3fdc5.jpg",
      receiverName: "Harvey Spectre"),
  new DataModel(
      senderName: "Harvey Spectre",
      message: "Hey I have hacked whatsapp!",
      time: "17:30",
      avatarUrl:
      "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb",
      receiverName: "Pranav Kapoor"),
  new DataModel(
      senderName: "Mike Ross",
      message: "Wassup !",
      time: "5:00",
      avatarUrl:
      "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb",
      receiverName: "Pranav Kapoor"),
  new DataModel(
      senderName: "Rachel",
      message: "I'm good!",
      time: "10:30",
      avatarUrl:
      "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb",
      receiverName: "Pranav Kapoor"),
  new DataModel(
      senderName: "Barry Allen",
      message: "I'm the fastest man alive!",
      time: "12:30",
      avatarUrl:
      "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb",
      receiverName: "Pranav Kapoor"),
  new DataModel(
      senderName: "Joe West",
      message: "Hey Flutter, You are so cool !",
      time: "15:30",
      avatarUrl:
      "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb",
      receiverName: "Pranav Kapoor"),
];