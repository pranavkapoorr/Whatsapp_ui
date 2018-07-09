import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:async';

class CameraScreen extends StatefulWidget {
  List<CameraDescription> cameras;

  Future<Null> main() async {
    this.cameras = await availableCameras();
  }

  CameraScreen() {
    main();
  }

  @override
  _CameraScreenState createState() => new _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController _controller;
  IconData _flashLight = Icons.flash_on;

  @override
  void initState() {
    super.initState();
    setCamController(0);

  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
  void setCamController(int num){
    if(widget.cameras!=null && !widget.cameras.isEmpty) {
      print("setting cam to $num");
      _controller =
      new CameraController(widget.cameras[num], ResolutionPreset.high);
      _controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }
  }

  void _changeFlashLight(){
    if(_flashLight == Icons.flash_on){
        setState(() {
          _flashLight = Icons.flash_off;
        });
    }else if(_flashLight == Icons.flash_off){
      setState(() {
        _flashLight = Icons.flash_on;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_controller==null || !_controller.value.isInitialized) {
      return new Scaffold(body: new Center(child: new Column(children: <Widget>[new CircularProgressIndicator()],),) );
    }
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Stack(
          fit: StackFit.expand,
          children:[
            new Padding(
              padding: new EdgeInsetsDirectional.only(top: 60.0,bottom: 50.0),
              child: new AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: new CameraPreview(_controller),
              ),
            ),
            new Column(mainAxisAlignment: MainAxisAlignment.end,children: <Widget>[
              new Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 30.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new SizedBox(
                            width: 90.0,
                            child: new IconButton(icon: new Icon(_flashLight, color: Colors.white), onPressed: _changeFlashLight)
                        ),
                      ],
                    ),
                    new Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          height:100.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: new Border.all(width: 2.0,color: Colors.white),
                          ),
                          child: new SizedBox(child: new FlatButton(onPressed: (){}, child: null,)),
                        ),
                      ],
                    ),
                    new Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new SizedBox(
                          width: 90.0,
                          child: new IconButton(icon:new Icon(Icons.camera_alt,color: Colors.white,), onPressed: (){
                            print("controllername:");
                            print(_controller.description.name);
                            if(_controller.description.name.endsWith("1")){
                              setState(() {
                                setCamController(0);
                              });
                            }else if(_controller.description.name.endsWith("0")){
                              setState(() {
                                setCamController(1);
                              });
                            }
                          }
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]
            ),
          ]


      ),
    );
  }



}