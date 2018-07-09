import 'package:flutter/material.dart';
import 'dart:async';
import 'CameraScreen.dart';
import 'CallScreen.dart';
import 'StatusScreen.dart';
import 'ChatScreen.dart';
import 'Settings_Screen.dart';
import 'ContactsUsingScreen.dart';


class WhatsappHome extends StatefulWidget {
  static String myNumber = "Pranav Kapoor";
  @override
  _WhatsappHomeState createState()=> new _WhatsappHomeState();

  static Future<bool> exitApp(BuildContext context) {
    return showDialog(
      context: context,
      // ignore: deprecated_member_use
      child: new AlertDialog(
        title: new Text('Do you want to exit this application?'),
        content: new Text('We hate to see you leave...'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => (){return new Future<bool>.value(false);},
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () =>(){return new Future<bool>.value(true);},
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ;
  }
}

class _WhatsappHomeState extends State<WhatsappHome> with TickerProviderStateMixin{
  ScrollController _scrollViewController;
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;
  TabController _tabController;
  bool _searchClicked = false;
  int _currentTab = 1;


  void _updateCurrentTab(){
    setState(() {
      _currentTab = _tabController.index;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollViewController = new ScrollController(keepScrollOffset: true);
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
    _tabController.addListener(_updateCurrentTab);
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 1));
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.easeIn,
    );
    _iconAnimation.addListener(() => this.setState(() {}));


  }

  void _easeInOutAppbar(){
    if(_currentTab==0) {
      _scrollViewController.animateTo(
          170.0, duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    }else if(_tabController.previousIndex==0){
      _scrollViewController.animateTo(
          0.0, duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
    }
  }
  @override
  Widget build(BuildContext context) {
    _easeInOutAppbar();
    return new WillPopScope(
      child: new Scaffold(
        backgroundColor: Colors.white,
        body: new NestedScrollView(
              controller: _scrollViewController,
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                _searchClicked?_searchAppBar(innerBoxIsScrolled):_normalAppBar(innerBoxIsScrolled),
              ];
              },
            body: new TabBarView(
              controller: _tabController,
              children: <Widget>[
                new CameraScreen(),
                new ChatScreen(),
                new StatusScreen(),
                new CallsScreen(),
              ],
            ),
          ),
        //),
        floatingActionButton: _floatingButton(_currentTab),
      ),
      onWillPop: (){return new Future<bool>.value(false);},
    );
  }

  SliverAppBar _searchAppBar(bool innerBoxIsScrolled){
    _iconAnimationController.forward();
    var searchTextField = new TextField(decoration: new InputDecoration(hintText: "         search here",suffixIcon: new Icon(Icons.search),border: InputBorder.none),);
    var searchTile = new ListTile(leading: new IconButton(icon: new Icon(Icons.arrow_back), onPressed: (){setState(() {
      _searchClicked = false;
      _iconAnimationController.reset();
    });}),title: searchTextField);
    return new SliverAppBar(
      title: Container(width: _iconAnimation.value * 1400.0,color: Colors.white,child: searchTile),
      elevation: 0.7,
      pinned: false,
      floating: true,
      forceElevated: innerBoxIsScrolled,
      bottom: new TabBar(
        controller: _tabController,
        indicatorColor: Colors.white,
        tabs: <Widget>[
          new Tab(icon: new Icon(Icons.photo_camera,size: 22.0,)),
          new Tab(text: "CHATS"),
          new Tab(text: "STATUS"),
          new Tab(text: "CALLS"),
        ],
      ),
    );
  }
  SliverAppBar _normalAppBar(bool innerBoxIsScrolled){
    return new SliverAppBar(
      title: new Text("Whatsapp"),
      elevation: 0.7,
      pinned: false,
      floating: true,
      forceElevated: innerBoxIsScrolled,
      bottom: new TabBar(
        controller: _tabController,
        indicatorColor: Colors.white,
        tabs: <Widget>[
          new Tab(icon: new Icon(Icons.photo_camera,size: 22.0,)),
          new Tab(text: "CHATS"),
          new Tab(text: "STATUS"),
          new Tab(text: "CALLS"),
        ],
      ),
      actions: <Widget>[
        new IconButton(icon:new Icon(Icons.search),onPressed: (){setState(() {
          _searchClicked = true;
        });},),
        new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
        ),
        new PopupMenuButton(
          elevation: 10.0,
          padding: new EdgeInsets.all(0.0),
          tooltip:"Settings",
          icon: new Icon(Icons.more_vert) ,
          onSelected: (dynamic value){
            Navigator.push(context, new MaterialPageRoute(builder: (context)=>value));
          },
          itemBuilder: (BuildContext context) => <PopupMenuItem>[
            new PopupMenuItem(
                value: new SettingsScreen(),
                child: new Text('Settings')
            ),
            new PopupMenuItem(
                value: null,
                child: new Text('About')
            ),
          ],
        ),
      ],
    );
  }

  FloatingActionButton _floatingButton(int tabCount){
    if(tabCount==1){
      return new FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: new Icon(
          Icons.message,
          color: Colors.white,
        ),
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new ContactsUsingScreen(WhatsappHome.myNumber))),
      );
    }else if(tabCount==2){
      return new FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: new Icon(
          Icons.photo,
          color: Colors.white,
        ),
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new ContactsUsingScreen(WhatsappHome.myNumber))),
      );
    }else if(tabCount==3){
      return new FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: new Icon(
          Icons.call,
          color: Colors.white,
        ),
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new ContactsUsingScreen(WhatsappHome.myNumber))),
      );
    }else{
      return null;
    }

  }


@override
  void dispose() {
    super.dispose();
    _scrollViewController.dispose();
    _tabController.dispose();
    _tabController.removeListener(_updateCurrentTab);
    _iconAnimationController.dispose();
  }
}

