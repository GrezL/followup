import 'package:flutter/material.dart';

class CheckingRoute extends StatelessWidget {
  CheckingRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        automaticallyImplyLeading: true,
        title: Text('Checking in'),
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