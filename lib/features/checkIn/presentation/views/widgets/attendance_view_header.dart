import 'package:ahu_hcs/constants.dart';
import 'package:flutter/material.dart';

class AttendanceViewHeader extends StatelessWidget {
  const AttendanceViewHeader({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: kWhiteColor,
          ),
        ),
      ),
    );
  }
}
