import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        String barcodeScanRes = 'https://flutterdeveloper.co';// await FlutterBarcodeScanner.scanBarcode(
            //'#3D8BEF', 'Cancel', false, ScanMode.QR);
      },
      child: Icon(Icons.qr_code_scanner_rounded),
    );
  }
}
