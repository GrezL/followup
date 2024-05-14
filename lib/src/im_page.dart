import 'package:flutter/material.dart';

class IMRoute extends StatelessWidget {
  IMRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        automaticallyImplyLeading: true,
        title: Text('I have a Question'),
        actions: <Widget>[
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.ac_unit))
        ],
      ),
      body: Row(
        children: []
      ),
    );
  }
}