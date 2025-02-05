import 'package:ahu_hcs/constants.dart';
import 'package:flutter/material.dart';

import '../../../data/models/attendance_model.dart';

class AttendanceItem extends StatelessWidget {
  const AttendanceItem({
    super.key,
    required this.index,
    required this.attendanceModel,
  });

  final int index;
  final AttendanceModel attendanceModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: index.isOdd ? kWhiteColor : kSecondaryColor,
      child: Row(
        children: [
          ItemBody(label: attendanceModel.checkOut),
          const VerticalDivider(width: 0, thickness: 1),
          ItemBody(label: attendanceModel.checkIn),
          const VerticalDivider(width: 0, thickness: 1),
          ItemBody(label: attendanceModel.date),
          const VerticalDivider(width: 0, thickness: 1),
          ItemBody(label: attendanceModel.day),
        ],
      ),
    );
  }
}

class ItemBody extends StatelessWidget {
  const ItemBody({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
