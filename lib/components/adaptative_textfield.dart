import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType? keyboardType;
  final String? placeholder;
  final void Function(String) onSubmitted;

  const AdaptativeTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.onSubmitted,
    required this.keyboardType,
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CupertinoTextField(
              placeholder: label,
              controller: controller,
              onSubmitted: onSubmitted,
              keyboardType: keyboardType,
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
          )
        : TextField(
            decoration: InputDecoration(
              labelText: label,
              hintText: placeholder,
            ),
            controller: controller,
            keyboardType: keyboardType, // const TextInputType.numberWithOptions(decimal: true),
            onSubmitted: onSubmitted,
          );
  }
}
