import 'package:ahu_hcs/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Clock extends StatelessWidget {
  const Clock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: kPrimaryColor,
      width: double.infinity,
      height: 200,
      child: StreamBuilder(
        stream: Stream.periodic(const Duration(seconds: 1)),
        builder: (context, snapshot) {
          return Text(
            DateFormat('hh:mm:ss a').format(DateTime.now()),
            style: const TextStyle(
              fontSize: 55,
              color: kWhiteColor,
              fontWeight: FontWeight.w600,
            ),
          );
        },
      ),
    );
  }
}
