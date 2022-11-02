import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
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
    return transactions.isEmpty
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
              final trans = transactions[index];

              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text(formatNumberToBrazilian(trans.value)),
                      ),
                    ),
                  ),
                  title: Text(
                    trans.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    formatDateToBrazilian(trans.date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.delete),
                          label: const Text('Excluir'),
                          style: TextButton.styleFrom(
                            foregroundColor: Theme.of(context).errorColor,
                          ),
                        )
                      : IconButton(
                          onPressed: () => onRemove(trans.id),
                          icon: const Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                        ),
                ),
              );
            },
          );
  }
}
