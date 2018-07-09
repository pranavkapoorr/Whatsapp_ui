import 'package:flutter/material.dart';
import 'package:whatsapp_ui/views/WhatsappHome.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Whatsapp',
      theme: new ThemeData(
        primaryColor: new Color(0xff075E54),
        accentColor: new Color(0xff25D366),
      ),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: new NamasteHome(),
    );
  }
}
