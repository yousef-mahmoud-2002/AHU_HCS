import 'package:ahu_hcs/core/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          '! مرحبا',
          style: TextStyle(
            fontSize: 30,
            height: 1,
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12, top: 12),
          child: Text(
            Caching.preferences.getString('traineeName') ?? '',
            style: const TextStyle(
              fontSize: 22,
              height: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
