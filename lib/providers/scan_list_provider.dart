import 'package:flutter/material.dart';
import 'package:qr_reader/providers/db_provider.dart';

import '../models/scan_model.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String typeSelected = 'http';

  Future<ScanModel> newScan(String value) async {
    final newScan = ScanModel(value: value);
    final id = await DbProvider.db.newScan(newScan);

    newScan.id = id;

    if (newScan.type == typeSelected) {
      scans.add(newScan);
      notifyListeners();
    }
    return newScan;
  }

  loadScans() async {
    final scans = await DbProvider.db.getAllScans();
    this.scans = [...scans!];
    notifyListeners();
  }

  loadScanByType(String type) async {
    final scans = await DbProvider.db.getScansByType(type);
    this.scans = [...scans!];
    typeSelected = type;
    notifyListeners();
  }

  deleteAll() async {
    await DbProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  deleteById(int id) async {
    await DbProvider.db.deleteScanById(id);
    loadScanByType(typeSelected);
  }
}
