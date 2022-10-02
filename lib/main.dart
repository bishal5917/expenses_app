import 'package:flutter/material.dart';

import './transaction.dart';

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
  final List<Transaction> transactions = [
    Transaction(
        id: 'i1',
        title: "Lenovo Legion Laptop",
        amount: 1055,
        date: DateTime.now()),
    Transaction(
        id: 'i2', title: "Naviforce Watch", amount: 29, date: DateTime.now())
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses Tracker',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Expenses Tracker'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              color: Color.fromARGB(255, 178, 182, 182),
              child: Container(
                child: Text("Chart"),
                width: 100,
              ),
              elevation: 5,
            ),
            Card(
              child: Container(
                child: Text("List of TXs"),
              ),
              elevation: 5,
            )
          ],
        ),
      ),
    );
  }
}
