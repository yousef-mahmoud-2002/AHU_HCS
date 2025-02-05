import 'package:ahu_hcs/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/check_in/check_in_cubit.dart';
import 'widgets/attendance_item.dart';
import 'widgets/attendance_view_header.dart';

class AttendanceView extends StatelessWidget {
  const AttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    var attendanceList = BlocProvider.of<CheckInCubit>(context).attendanceList;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Align(
          alignment: Alignment.topRight,
          child: Text(
            'سجل الحضور للتدريب',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
      ),
      body: attendanceList.isNotEmpty
          ? SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    color: kPrimaryColor,
                    child: const Row(
                      children: [
                        AttendanceViewHeader(label: 'المغادرة'),
                        VerticalDivider(width: 0, thickness: 1),
                        AttendanceViewHeader(label: 'الحضور'),
                        VerticalDivider(width: 0, thickness: 1),
                        AttendanceViewHeader(label: 'التاريخ'),
                        VerticalDivider(width: 0, thickness: 1),
                        AttendanceViewHeader(label: 'اليوم'),
                      ],
                    ),
                  ),
                  ListView.separated(
                    itemCount: attendanceList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return const Divider(height: 0, thickness: 1);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return AttendanceItem(
                        index: index,
                        attendanceModel: attendanceList[index],
                      );
                    },
                  ),
                  const Divider(height: 0, thickness: 1)
                ],
              ),
            )
          : const Center(
              child: Text(
                'سجل الحضور فارغ',
                style: TextStyle(fontSize: 20),
              ),
            ),
    );
  }
}
