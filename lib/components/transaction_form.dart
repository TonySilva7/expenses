import 'package:expenses/components/adaptative_button.dart';
import 'package:expenses/components/adaptative_date_picker.dart';
import 'package:expenses/components/adaptative_textfield.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) handleSubmit;

  const TransactionForm({super.key, required this.handleSubmit});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _handleOnSubmit() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.handleSubmit(title, value, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            children: <Widget>[
              AdaptativeTextField(
                controller: _titleController,
                label: 'Título',
                onSubmitted: (_) => _handleOnSubmit,
                keyboardType: TextInputType.text,
                placeholder: 'Informe o título',
              ),
              AdaptativeTextField(
                controller: _valueController,
                label: 'Valor (R\$)',
                onSubmitted: (_) => _handleOnSubmit,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                placeholder: 'Informe o valor',
              ),
              AdaptativeDatePicker(
                selectedDate: _selectedDate,
                onDateChanged: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdaptativeButton(onPressed: _handleOnSubmit, label: 'Nova Transação'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
