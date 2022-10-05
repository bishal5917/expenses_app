import 'package:expenses_app/chart.dart';
import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import './transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> userTransaction = [
    Transaction(
        id: 'i1',
        title: "Lenovo Legion Laptop",
        amount: 1055,
        date: DateTime.now()),
    Transaction(
        id: 'i2', title: "Naviforce Watch", amount: 29, date: DateTime.now())
  ];

  List<Transaction> get recentTransaction {
    return userTransaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void addTransaction(String title, double amount) {
    final newtx = Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      userTransaction.add(newtx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: NewTransaction(addTransaction),
        ),
        Chart(recentTransaction),
        TransactionList(userTransaction)
      ],
    );
  }
}
