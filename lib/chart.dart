import 'package:expenses_app/chartbar.dart';
import 'package:expenses_app/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekday.day &&
            recentTransactions[i].date.month == weekday.month &&
            recentTransactions[i].date.year == weekday.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      // print(totalSum);
      return {'day': DateFormat.E().format(weekday), 'amount': totalSum};
    });
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Row(children: [
        ...(groupedTransactionValues).map((data) {
          return ChartBar(
              data['day'],
              data['amount'],
              totalSpending == 0
                  ? 0.0
                  : (data['amount'] as double) / totalSpending);
        }),
        // ChartBar()
      ]),
    );
  }
}
