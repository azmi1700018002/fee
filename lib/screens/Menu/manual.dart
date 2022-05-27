import 'package:flutter/material.dart';

class Manuals extends StatefulWidget{
  @override
  _ManualsState createState() => _ManualsState();
}

class _ManualsState extends State<Manuals>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Manuals')),
      body: Center(
        child: Text('Manuals Screen'),
      ),
    );
  }
}