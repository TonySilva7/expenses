import 'dart:math';

import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transactions(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transactions(
      id: 't3',
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transactions(
      id: 't4',
      title: 'Conta #01',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transactions(
      id: 't5',
      title: 'Conta #02',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transactions(
      id: 't6',
      title: 'Conta #03',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transactions(
      id: 't7',
      title: 'Conta #04',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transactions(
      id: 't8',
      title: 'Conta #05',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transactions(
      id: 't9',
      title: 'Conta #06',
      value: 211.30,
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transactions(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(
          handleSubmit: _addTransaction,
        ),
        TransactionList(transactions: _transactions),
      ],
    );
  }
}
