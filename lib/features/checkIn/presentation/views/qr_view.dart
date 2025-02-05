import 'package:ahu_hcs/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';
import '../manager/check_in/check_in_cubit.dart';

class QrView extends StatefulWidget {
  const QrView({super.key});

  @override
  State<QrView> createState() => _QrViewState();
}

class _QrViewState extends State<QrView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('QR Code ' 'امسح رمز ال'),
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: MobileScannerController(
              detectionSpeed: DetectionSpeed.noDuplicates,
            ),
            onDetect: (capture) {
              BlocProvider.of<CheckInCubit>(context).processScannedQRCode(
                context,
                capture.barcodes.first.rawValue!,
              );
            },
          ),
          QRScannerOverlay(
            borderColor: kPrimaryColor,
            borderStrokeWidth: 9,
            scanAreaWidth: MediaQuery.of(context).size.width - 100,
            scanAreaHeight: MediaQuery.of(context).size.width - 125,
          ),
          Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(top: 75),
            child: Text(
              'داخل الإطار' ' QR_Code ' 'ضع ال',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: kWhiteColor.withOpacity(0.7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
