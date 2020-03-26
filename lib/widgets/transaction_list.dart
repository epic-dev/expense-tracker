import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          var transaction = transactions[index];
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    '\$${transaction.amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).accentColor, width: 2)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transaction.title,
                      style: TextStyle(
                          decoration: TextDecoration.underline, fontSize: 24.0),
                    ),
                    Text(
                      DateFormat.yMMMd().add_Hm().format(transaction.dateTime),
                      style: TextStyle(color: Colors.grey, fontSize: 16.0),
                      overflow: TextOverflow.fade,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
