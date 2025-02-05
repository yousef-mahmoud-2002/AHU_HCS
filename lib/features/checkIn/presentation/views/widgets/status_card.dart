import 'package:ahu_hcs/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/check_in/check_in_cubit.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckInCubit, CheckInState>(
      builder: (context, state) {
        return Container(
          height: 125,
          decoration: const BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                spreadRadius: 2,
                color: kShadowColor,
              ),
            ],
          ),
          child: Row(
            children: [
              CardBody(
                label: 'وقت المغادرة',
                time: BlocProvider.of<CheckInCubit>(context).checkOut,
              ),
              const VerticalDivider(width: 0, thickness: 1),
              CardBody(
                label: 'وقت الحضور',
                time: BlocProvider.of<CheckInCubit>(context).checkIn,
              ),
            ],
          ),
        );
      },
    );
  }
}

class CardBody extends StatelessWidget {
  const CardBody({super.key, required this.label, required this.time});

  final String label;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            label,
            style: const TextStyle(height: 1, fontSize: 19, letterSpacing: 1),
          ),
          const SizedBox(height: 16),
          const Divider(height: 0, thickness: 1),
          const Spacer(),
          Text(
            time,
            style: const TextStyle(fontSize: 18),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
