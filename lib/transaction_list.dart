import 'dart:ui';

import 'package:flutter/material.dart';

import './transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...(transactions).map((tx) {
          return Card(
              child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: CircleAvatar(
                  backgroundColor: Colors.teal,
                  radius: 50,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: 100,
                    child: Text(
                      '\$' + tx.amount.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 197, 204, 210)),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    tx.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
    );
  }
}
