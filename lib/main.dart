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
            Container(
              padding: EdgeInsets.all(10),
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                    ),
                    OutlinedButton(onPressed: () {}, child: Text('Add'))
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...(transactions).map((tx) {
                  return Card(
                      child: Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple, width: 2)),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$' + tx.amount.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.red),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            tx.title,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            tx.date.toString(),
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ));
                }).toList(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
