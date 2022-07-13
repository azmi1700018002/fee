import 'package:flutter/material.dart';

class Scren2 extends StatelessWidget {
  const Scren2({
    Key key,
    this.payload,
  }) : super(key: key);

  final String payload;

  @override
  Widget build(BuildContext Context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          payload,
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
