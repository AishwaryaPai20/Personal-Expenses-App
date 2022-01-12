import 'dart:math';
import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

// ignore: must_be_immutable
class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;
  Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  State<TransactionList> createState() => _TransactionListState();
}
class _TransactionListState extends State<TransactionList> {
  Color _bgColor;

  @override
  void initState() {
    const availableColors = [
      Colors.orange,
      Colors.red,
      Colors.cyan,
      Colors.blue,
      Colors.purple,
      Colors.pink,
    ];
    _bgColor = availableColors[Random().nextInt(6)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.60,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(
                  transaction: widget.transactions[index],
                  deleteTx: widget.deleteTx);
            },
            itemCount: widget.transactions.length,
          );
  }
}
// return Card(
//                   child: Row(
//                     children: <Widget>[
//                       Container(
//                         margin:
//                             EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Theme.of(context).primaryColor,
//                             width: 2,
//                           ),
//                         ),
//                         child: Text(
//                           '\$${transactions[index].amount.toStringAsFixed(2)}', //tx.amount.toString(),
//                           style: Theme.of(context).textTheme.headline6,
//                         ),
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(transactions[index].title,
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               )),
//                           Text(
//                               // DateFormat('yyyy/MM/dd!').format(tx.date),
//                               DateFormat.yMMMd()
//                                   .format(transactions[index].date),
//                               style: TextStyle(
//                                   fontSize: 12, color: Colors.blueGrey)),
//                         ],
//                       ),
//                     ],
//                   ),
//                 );