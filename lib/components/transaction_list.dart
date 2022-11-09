import 'package:expenses/components/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList({
    super.key,
    required this.transactions,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraint) => (Column(
              children: [
                SizedBox(height: constraint.maxHeight * 0.05),
                SizedBox(
                  height: constraint.maxHeight * 0.3,
                  child: Text(
                    'Nenhuma Transação Cadastrada',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                SizedBox(height: constraint.maxHeight * 0.05),
                SizedBox(
                  height: constraint.maxHeight * 0.6,
                  // child: Image.asset(
                  //   'assets/images/waiting.jpeg',
                  //   fit: BoxFit.cover,
                  // ),
                  child: SvgPicture.asset(
                    'assets/images/waiting.svg',
                    // color: Theme.of(context).colorScheme.secondary,
                    semanticsLabel: 'A red up arrow',
                  ),
                ),
              ],
            )),
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final trans = transactions[index];

              return TransactionItem(key: GlobalObjectKey(trans), trans: trans, onRemove: onRemove);
            },
          );
  }
}
