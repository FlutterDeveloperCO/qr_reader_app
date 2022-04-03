import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/url_launcher.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        final barcodeScanRes = '6.257431, -75.591563';// await FlutterBarcodeScanner.scanBarcode(
            //'#3D8BEF', 'Cancel', false, ScanMode.QR);
        
        if (barcodeScanRes == '-1'){
          return ;
        }
        
        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

        final newScan = await scanListProvider.newScan(barcodeScanRes);

        launchURL(context, newScan);        
      },
      child: Icon(Icons.qr_code_scanner_rounded),
    );
  }
}
