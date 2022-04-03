import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_model.dart';

class MapScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;

    return Scaffold(
      appBar: AppBar(title: Text('Location'), centerTitle: true,),
      body: Center(child: Text(scan.value),),
      
    );
  }
}