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
      avatarUrl: "https://scontent-lht6-1.xx.fbcdn.net/v/t1.0-9/11230099_10206835592669367_2911893136176495642_n.jpg?_nc_cat=0&oh=eb80db39d72968cc4a130d4d075ea24a&oe=5BE80A4C",
      receiverName: "Harvey Spectre"),
  new DataModel(
      senderName: "Sahil Seth",
      message: "Hey I have hacked whatsapp!",
      time: "17:30",
      avatarUrl:
      "https://media.licdn.com/dms/image/C4D03AQGxLV7vydUjcw/profile-displayphoto-shrink_200_200/0?e=1536796800&v=beta&t=2LJRvqa-_JO5IpPOvt7FabyF0Xs6P_IUSCbfU2djbtQ",
      receiverName: "Pranav Kapoor"),
  new DataModel(
      senderName: "Sahil Shankra",
      message: "Wassup !",
      time: "05:00",
      avatarUrl:
      "https://scontent-lht6-1.xx.fbcdn.net/v/t1.0-9/34138868_1779803158724975_3822876881804328960_n.jpg?_nc_cat=0&oh=e102efd0922669816898a22056821d1a&oe=5BDB0F78",
      receiverName: "Pranav Kapoor"),
  new DataModel(
      senderName: "Rahul Phillip",
      message: "I'm good!",
      time: "10:30",
      avatarUrl:
      "https://scontent-lht6-1.xx.fbcdn.net/v/t1.0-9/25552299_10210350131101868_818494721727394349_n.jpg?_nc_cat=0&oh=2a283a297037a77064ff9037b6e1654c&oe=5BD7C37B",
      receiverName: "Pranav Kapoor"),
  new DataModel(
      senderName: "Michael Jackson",
      message: "I'm the fastest man alive!",
      time: "12:30",
      avatarUrl:
      "https://www.songhall.org/images/uploads/exhibits/Michael_Jackson.jpg",
      receiverName: "Pranav Kapoor"),
  new DataModel(
      senderName: "Dan Bilzerian",
      message: "Hey Flutter, You are so cool !",
      time: "15:30",
      avatarUrl:
      "https://pbs.twimg.com/profile_images/526334387688710145/zXycT5FL.jpeg",
      receiverName: "Pranav Kapoor"),
];