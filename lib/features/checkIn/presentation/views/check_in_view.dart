import 'package:ahu_hcs/constants.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_drawer.dart';
import 'widgets/check_in_button.dart';
import 'widgets/clock.dart';
import 'widgets/status_card.dart';
import 'widgets/welcome_text.dart';

class CheckInView extends StatelessWidget {
  const CheckInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      endDrawer: const AppDrawer(),
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: Image.asset(kAppLogo),
        ),
        title: const Text(
          'نظام المركز الصحي',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            height: 1,
          ),
        ),
      ),
      body: const Column(
        children: [
          Clock(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 48,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  WelcomeText(),
                  Spacer(flex: 2),
                  StatusCard(),
                  Spacer(flex: 2),
                  CheckInButton(),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
