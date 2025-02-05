import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

Future<bool> checkInternet(BuildContext context) async {
  var internetCondition = await Connectivity().checkConnectivity();
  if (internetCondition.contains(ConnectivityResult.none)) {
    return false;
  } else {
    return true;
  }
}
