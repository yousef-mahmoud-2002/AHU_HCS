import 'package:ahu_hcs/constants.dart';
import 'package:ahu_hcs/core/utils/app_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/animate_navigation_route.dart';
import '../../manager/check_in/check_in_cubit.dart';
import '../qr_view.dart';

class CheckInButton extends StatelessWidget {
  const CheckInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckInCubit, CheckInState>(
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: BlocProvider.of<CheckInCubit>(context).gapScanning != 0,
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (BlocProvider.of<CheckInCubit>(context).checkOut !=
                    "-- : --") {
                  appSnackBar(context, 'انتظر لليوم التالي');
                } else {
                  Navigator.of(context).push(
                    animateRoute(const QrView()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: BlocProvider.of<CheckInCubit>(context)
                                .checkOut !=
                            '-- : --' ||
                        BlocProvider.of<CheckInCubit>(context).gapScanning != 0
                    ? Colors.grey
                    : kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadowColor: kShadowColor,
                elevation: 4,
              ),
              child: Text(
                BlocProvider.of<CheckInCubit>(context).checkIn == "-- : --"
                    ? 'تسجيل وقت الحضور'
                    : 'تسجيل وقت المغادرة',
                style: const TextStyle(
                  fontSize: 16,
                  wordSpacing: 2,
                  letterSpacing: 1,
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
