import 'package:flutter/material.dart';

class IMRoute extends StatelessWidget {
  const IMRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        automaticallyImplyLeading: true,
        title: const Text('Communication'),
         actions: <Widget>[
          IconButton(onPressed: (){}, icon: const Icon(Icons.camera_alt), tooltip: 'Upload diagnosis',),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications), tooltip: 'Notification',),
        ],
      ),
      body: const Row(
        children: []
      ),
    );
  }
}