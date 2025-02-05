import 'package:flutter/material.dart';
import '../../../../../constants.dart';

class DrawerImage extends StatelessWidget {
  const DrawerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Image.asset(kAppLogo, height: 200),
          const SizedBox(height: 24),
          const Text(
            'نظام المركز الصحي',
            style: TextStyle(
              height: 1,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
