import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transactions;
  TransactionList({super.key, required this.transactions});

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
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'Nenhuma Transação Cadastrada',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
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
            )
          : ListView.builder(
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
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.1),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        NumberFormat.currency(
                          locale: 'pt_BR',
                          symbol: 'R\$',
                          decimalDigits: 2,
                        ).format(tr.value),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          // style: const TextStyle(
                          //   fontSize: 16,
                          //   fontWeight: FontWeight.bold,
                          // ),
                          style: Theme.of(context).textTheme.headline6,
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
