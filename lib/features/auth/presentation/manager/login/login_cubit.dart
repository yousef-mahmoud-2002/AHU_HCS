import 'package:ahu_hcs/core/utils/app_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/animate_navigation_route.dart';
import '../../../../../core/utils/app_snack_bar.dart';
import '../../../../../core/utils/check_internet_connection.dart';
import '../../../../../core/utils/shared_pref.dart';
import '../../../../checkIn/data/models/attendance_model.dart';
import '../../../../checkIn/presentation/manager/check_in/check_in_cubit.dart';
import '../../../../checkIn/presentation/views/check_in_view.dart';
import '../../views/login_view.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  String? traineeId;
  String? password;

  void loginUser(BuildContext context) async {
    if (await checkInternet(context)) {
      emit(LoginLoading());
      if (context.mounted) {
        sqlLogin(context);
      }
    } else {
      if (context.mounted) {
        appSnackBar(context, 'لا يوجد اتصال بالانترنت');
      }
    }
  }

  void sqlLogin(BuildContext context) async {
    bool loginStatus = await AppServices.loginService(traineeId, password);

    if (context.mounted) {
      if (loginStatus) {
        fetchNetworkData(context);
        Navigator.pushReplacement(
          context,
          animateRoute(const CheckInView()),
        );

        emit(LoginSuccess());
      } else {
        emit(LoginFailure());
        appSnackBar(
          context,
          'الرقم الجامعي او كلمة المرور خاطئة',
        );
      }
    }
  }

  void logoutUser(BuildContext context) async {
    var attendanceBox = Hive.box<AttendanceModel>(kAttendanceBox);

    await attendanceBox.clear();

    if (context.mounted) {
      BlocProvider.of<CheckInCubit>(context).fetchCachedData();

      Caching.logOut();

      Navigator.pushAndRemoveUntil(
        context,
        animateRoute(const LoginView(), side: -2),
        (route) => false,
      );
    }
  }
}

void fetchNetworkData(BuildContext context) async {
  var records = await AppServices.fetchDataService();
  var attendanceBox = Hive.box<AttendanceModel>(kAttendanceBox);

  attendanceBox.addAll(records);

  if (context.mounted) {
    BlocProvider.of<CheckInCubit>(context).fetchCachedData();
  }
}
