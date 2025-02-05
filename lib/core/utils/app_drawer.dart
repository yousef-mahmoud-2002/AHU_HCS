import 'package:ahu_hcs/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/presentation/manager/login/login_cubit.dart';
import '../../features/checkIn/presentation/views/attendance_view.dart';
import '../../features/checkIn/presentation/views/widgets/about_us.dart';
import '../../features/checkIn/presentation/views/widgets/drawer_image.dart';
import '../widgets/drawer_item.dart';
import 'animate_navigation_route.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const DrawerImage(),
              const Divider(thickness: 1, height: 0, color: kPrimaryColor),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 24,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DrawerItem(
                      text: 'سجل الحضور',
                      icon: Icons.history,
                      onPressed: () {
                        Navigator.of(context).push(
                          animateRoute(const AttendanceView()),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    DrawerItem(
                      text: 'حول',
                      icon: Icons.info_outline,
                      onPressed: () {
                        Navigator.of(context).push(
                          animateRoute(const AboutUs()),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    DrawerItem(
                      foregroundColor: kRedColor,
                      text: "تسجيل خروج",
                      icon: Icons.logout,
                      onPressed: () {
                        BlocProvider.of<LoginCubit>(context)
                            .logoutUser(context);
                      },
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.copyright, size: 13, color: kPrimaryColor),
                      Text(
                        ' AHU - iT',
                        style: TextStyle(fontSize: 12, color: kPrimaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
