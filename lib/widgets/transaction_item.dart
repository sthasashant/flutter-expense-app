import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTxn,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTxn;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(child: Text('\$${transaction.amount}')),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton.icon(
                icon: const Icon(Icons.delete),
                label: const Text('Delete'),
                style: TextButton.styleFrom(
                    primary: Theme.of(context).accentColor),
                onPressed: () => deleteTxn(transaction.id),
              )
            // FlatButton.icon(
            //     icon: Icon(Icons.delete),
            //     label: Text('Delete'),
            //     textColor: Theme.of(context).errorColor,
            //     onPressed: () => deleteTxn(transaction.id),
            //   )
            : IconButton(
                icon: const Icon(Icons.delete_outline),
                color: Theme.of(context).accentColor,
                onPressed: () => deleteTxn(transaction.id),
              ),
      ),
    );
  }
}
