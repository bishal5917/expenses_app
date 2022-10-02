import 'package:flutter/material.dart';

import './user_transactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses Tracker',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Expenses Tracker'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              color: Color.fromARGB(255, 178, 182, 182),
              child: Container(
                child: Text("Chart"),
                width: 100,
              ),
              elevation: 5,
            ),
            UserTransaction()
          ],
        ),
      ),
    );
  }
}
