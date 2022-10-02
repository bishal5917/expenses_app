import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addNewTx;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addNewTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
            keyboardType: TextInputType.text,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
          OutlinedButton(
              onPressed: () {
                if (titleController.text != null &&
                    double.parse(amountController.text) > 0) {
                  addNewTx(titleController.text,
                      double.parse(amountController.text));
                }
              },
              child: Text('Add'))
        ],
      ),
    );
  }
}
