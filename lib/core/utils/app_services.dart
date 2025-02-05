import 'package:ahu_hcs/constants.dart';
import 'package:ahu_hcs/core/utils/shared_pref.dart';
import 'package:dio/dio.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../features/checkIn/data/models/attendance_model.dart';

class AppServices {
  static Future<bool> loginService(traineeID, password) async {
    try {
      Response response = await Dio().get('$baseUrl$traineeID');

      if (response.data['password'] == password) {
        Caching.saveTraineeName(response.data['traineeName']);
        Caching.saveTraineeId(response.data['traineeId']);
        Caching.keepLoggedIn();

        return true;
      } else {
        return false;
      }
    } on Exception {
      return false;
    }
  }

  static Future<List<AttendanceModel>> fetchDataService() async {
    String traineeId = Caching.preferences.getString('traineeId')!;
    Response response = await Dio().get('$baseUrl$traineeId/attendance');

    List<AttendanceModel> attendanceList = [];

    for (var record in response.data) {
      String leaveTime = '-- : --';

      var recordTime = await formatCustomDate(record['enterDate']);
      if (record['leaveDate'] != null) {
        var leaveDate = await formatCustomDate(record['leaveDate']);
        leaveTime = leaveDate['time']!;
      }

      attendanceList.add(
        AttendanceModel(
          date: recordTime['date']!,
          day: recordTime['day']!,
          checkIn: recordTime['time']!,
          checkOut: leaveTime,
        ),
      );
    }
    return attendanceList;
  }

  static Future<Map<String, String>> formatCustomDate(String inputDate) async {
    await initializeDateFormatting('ar_EG');

    DateTime dateTime = DateTime.parse(inputDate);

    String date = DateFormat('yyyy-MM-dd').format(dateTime);

    String time = DateFormat('a  h:mm', 'en_US')
        .format(dateTime)
        .replaceAll('AM', 'ص')
        .replaceAll('PM', 'م');

    String day = DateFormat('EEEE', 'ar_EG').format(dateTime);

    return {
      'day': day,
      'date': date,
      'time': time,
    };
  }

  static void checkInService() async {
    String traineeId = Caching.preferences.getString('traineeId')!;

    Dio().post(
      '$baseUrl$traineeId/attendance',
      data: {
        'traineeId': traineeId,
        'enterDate': DateTime.now().toString(),
        'leaveDate': '-- : --',
      },
    );
  }

  static void checkOutService() async {
    String traineeId = Caching.preferences.getString('traineeId')!;
    Response response = await Dio().get('$baseUrl$traineeId/attendance');

    int lastId = response.data.last['attendaceRecordId'];
    String enterDate = response.data.last['enterDate'];

    Dio().put(
      '${baseUrl}attendance/$lastId',
      data: {
        'attendaceRecordId': lastId,
        'traineeId': traineeId,
        'enterDate': enterDate,
        'leaveDate': DateTime.now().toString(),
      },
    );
  }
}
