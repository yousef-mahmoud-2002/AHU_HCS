import 'package:ahu_hcs/core/utils/app_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_snack_bar.dart';
import '../../../data/models/attendance_model.dart';

part 'check_in_state.dart';

class CheckInCubit extends Cubit<CheckInState> {
  CheckInCubit() : super(CheckInInitial());

  String checkIn = '-- : --';
  String checkOut = '-- : --';
  int gapScanning = 0;

  List<AttendanceModel> attendanceList = [];

  void fetchCachedData() async {
    var attendanceBox = Hive.box<AttendanceModel>(kAttendanceBox);
    var time = await AppServices.formatCustomDate(DateTime.now().toString());

    if (attendanceBox.isNotEmpty) {
      for (var day in attendanceBox.values) {
        if (day.date == time['date']) {
          checkIn = day.checkIn;
          checkOut = day.checkOut;
        }
      }
      attendanceList = attendanceBox.values.toList();
    } else {
      attendanceList = [];
      checkIn = '-- : --';
      checkOut = '-- : --';
    }
    emit(FetchData());
  }

  void processScannedQRCode(BuildContext context, String scannedUrl) async {
    if (scannedUrl.contains(kAttendanceQrUrl)) {
      final int uploadTime = int.parse(scannedUrl.split('t=').last);

      final DateTime nowTime = DateTime.now();

      final int scanTime = nowTime.millisecondsSinceEpoch;

      gapScanning = scanTime - uploadTime;

      if (gapScanning <= 115000) {
        var time = await AppServices.formatCustomDate(nowTime.toString());

        if (checkIn != time['time']) {
          setTime();
          await Future.delayed(const Duration(seconds: 0)).then(
            (value) {
              appSnackBar(context, 'تم تسجيل الوقت بنجاح', success: true);
            },
          );
          await Future.delayed(const Duration(milliseconds: 1000)).then(
            (value) {
              Navigator.pop(context);
            },
          );
        }
      } else {
        appSnackBar(context, 'غير صالح QR');
      }
      await Future.delayed(const Duration(seconds: 5)).then(
        (value) {
          gapScanning = 0;
          emit(QrValidation());
        },
      );
    } else {
      appSnackBar(context, 'غير صحيح QR');
    }
  }

  void setTime() async {
    var attendanceBox = Hive.box<AttendanceModel>(kAttendanceBox);
    var time = await AppServices.formatCustomDate(DateTime.now().toString());

    if (checkIn == '-- : --') {
      checkIn = time['time']!;
      AttendanceModel attendanceModel = AttendanceModel(
        date: time['date']!,
        day: time['day']!,
        checkIn: checkIn,
        checkOut: checkOut,
      );

      await attendanceBox.add(attendanceModel);

      AppServices.checkInService();
    } else {
      checkOut = time['time']!;
      for (var day in attendanceBox.values) {
        if (day.date == time['date']) {
          day.checkOut = checkOut;
          day.save();
        }
      }
      AppServices.checkOutService();
    }
    attendanceList = attendanceBox.values.toList();
    emit(CheckIn());
  }
}
