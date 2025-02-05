import 'package:hive/hive.dart';

part 'attendance_model.g.dart';

@HiveType(typeId: 0)
class AttendanceModel extends HiveObject {
  @HiveField(0)
  final String date;
  @HiveField(1)
  final String day;
  @HiveField(2)
  final String checkIn;
  @HiveField(3)
  String checkOut;

  AttendanceModel({
    required this.date,
    required this.day,
    required this.checkIn,
    required this.checkOut,
  });
}
