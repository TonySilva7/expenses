import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transactions;
  const TransactionList({super.key, required this.transactions});

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
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          final tr = transactions[index];

          return Card(
            child: Row(children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple,
                    width: 2,
                  ),
                ),
                padding: const EdgeInsets.all(10),
                child: Text(
                  NumberFormat.currency(
                    locale: 'pt_BR',
                    symbol: 'R\$',
                    decimalDigits: 2,
                  ).format(tr.value),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    tr.title,
                  ),
                  Text(
                    style: const TextStyle(color: Colors.grey),
                    formatDateToBrazilian(tr.date),
                  ),
                ],
              )
            ]),
          );
        },
      ),
    );
  }
}
