import 'package:expenses/components/chart_bar.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart({super.key, required this.recentTransactions});

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      // subtrai do dia atual, a contagem de dias representada pelo index
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalValue = recentTransactions.fold(0.0, (acc, item) {
        if (item.date.day == weekDay.day &&
            item.date.month == weekDay.month &&
            item.date.year == weekDay.year) {
          return acc + item.value;
        }
        return acc;
      });

      return {
        // pega a primeira letra do dia da semana
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalValue,
      };
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransactionValues.fold(0.0, (acc, trans) {
      return acc + (trans['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((trans) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: trans['day'].toString(),
                value: trans['value'] as double,
                percentage: _weekTotalValue == 0
                    ? 0
                    : (trans['value'] as double) / _weekTotalValue,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
