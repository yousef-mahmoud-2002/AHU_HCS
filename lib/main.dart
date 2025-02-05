import 'package:ahu_hcs/core/utils/app_theme.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ahu_hcs/constants.dart';
import 'features/auth/presentation/views/login_view.dart';
import 'features/checkIn/data/models/attendance_model.dart';
import 'features/checkIn/presentation/views/check_in_view.dart';
import 'features/auth/presentation/manager/login/login_cubit.dart';
import 'features/checkIn/presentation/manager/check_in/check_in_cubit.dart';

late bool isLogged;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(AttendancemodelAdapter());
  await Hive.openBox<AttendanceModel>(kAttendanceBox);

  await Caching.init();
  isLogged = Caching.preferences.getBool('isLogged') ?? false;

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: kSecondaryColor,
    statusBarColor: kPrimaryColor,
  ));

  runApp(const HealthCenterSystem());
}

class HealthCenterSystem extends StatelessWidget {
  const HealthCenterSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CheckInCubit()..fetchCachedData(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
      ],
      child: MaterialApp(
        title: ktitle,
        theme: appTheme(),
        debugShowCheckedModeBanner: false,
        home: isLogged ? const CheckInView() : const LoginView(),
      ),
    );
  }
}
