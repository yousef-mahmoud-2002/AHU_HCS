import 'package:flutter/material.dart';
import '../../constants.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    this.foregroundColor,
    required this.text,
    required this.icon,
    this.onPressed,
  });

  final Color? foregroundColor;
  final String text;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      textColor: foregroundColor ?? kPrimaryColor,
      padding: const EdgeInsets.all(12),
      color: kWhiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: foregroundColor ?? kPrimaryColor),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          const Icon(Icons.arrow_forward_ios),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.end,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(width: 16),
          Icon(icon, size: 26),
        ],
      ),
    );
  }
}
