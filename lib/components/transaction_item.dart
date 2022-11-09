import 'dart:math';

import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  final Transaction trans;
  final void Function(String p1) onRemove;

  static const colors = [
    Colors.red,
    Colors.purple,
    Colors.orange,
    Colors.blue,
    Colors.black,
  ];

  const TransactionItem({
    Key? key,
    required this.trans,
    required this.onRemove,
  }) : super(key: key);

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _backGroundColor = TransactionItem.colors[Random().nextInt(TransactionItem.colors.length)];

  @override
  void initState() {
    super.initState();
    int i = Random().nextInt(TransactionItem.colors.length);
    _backGroundColor = TransactionItem.colors[i];
  }

  String formatNumberToBrazilian(double value) {
    return 'R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}';
  }

  String formatDateToBrazilian(DateTime date) {
    initializeDateFormatting('pt_BR');
    final formatter = DateFormat.yMMMd('pt_BR');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _backGroundColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(formatNumberToBrazilian(widget.trans.value)),
            ),
          ),
        ),
        title: Text(
          widget.trans.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          formatDateToBrazilian(widget.trans.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton.icon(
                onPressed: () => widget.onRemove(widget.trans.id),
                icon: const Icon(Icons.delete),
                label: const Text('Excluir'),
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).errorColor,
                ),
              )
            : IconButton(
                onPressed: () => widget.onRemove(widget.trans.id),
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
