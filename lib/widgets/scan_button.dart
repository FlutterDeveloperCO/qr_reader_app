import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        final barcodeScanRes = 'https://flutterdeveloper.co';// await FlutterBarcodeScanner.scanBarcode(
            //'#3D8BEF', 'Cancel', false, ScanMode.QR);
        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
        scanListProvider.newScan(barcodeScanRes);
        scanListProvider.newScan('geo:125.26,29.26');        
      },
      child: Icon(Icons.qr_code_scanner_rounded),
    );
  }
}
