import '../models/transaction.dart';
import '../widgets/transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function delete;
  TransactionList(this.transactions, this.delete);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  "No transactions added yet!",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  // margin: EdgeInsets.only(top: 10),
                  height: constraints.maxHeight * 0.7,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            // shrinkWrap: true,
            itemBuilder: (ctx, index) {
              return TransactionItem(
                  transaction: transactions[index],
                  delete: delete,
                  index: index);
            },
            itemCount: transactions.length,
          );
  }
}
