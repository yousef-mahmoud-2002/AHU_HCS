import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget {
  const CardTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'نظام المركز الصحي',
      style: TextStyle(
        height: 1.2,
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
