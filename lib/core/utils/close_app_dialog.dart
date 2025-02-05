import 'package:ahu_hcs/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

closeAppDialog(BuildContext context) => showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Padding(
            padding: EdgeInsets.only(bottom: 20, top: 8),
            child: Icon(
              CupertinoIcons.info,
              color: Colors.blue,
              size: 35,
            ),
          ),
          content: const Padding(
            padding: EdgeInsets.symmetric(vertical: 0),
            child: Text(
              'أنت على وشك مغادرة التطبيق',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'البقاء',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              child: const Text(
                'خروج',
                style: TextStyle(
                  fontSize: 14,
                  color: kRedColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
