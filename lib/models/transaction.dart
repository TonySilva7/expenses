import 'package:flutter/material.dart';

class Transaction extends StatelessWidget {
  final String id;
  final String title;
  final double value;
  final DateTime date;

  const Transaction({
    super.key,
    required this.id,
    required this.title,
    required this.value,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
