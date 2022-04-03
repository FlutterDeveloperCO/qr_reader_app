import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Providers
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';

//Screens
import 'package:qr_reader/screens/history_maps_screen.dart';
import 'package:qr_reader/screens/history_urls_screen.dart';

//Widgets
import '../widgets/scan_button.dart';
import '../widgets/navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete_forever_rounded),
          ),
        ],
      ),
      body: _HomeBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedIndex;

    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.loadScanByType('geo');
        return HistoryMapsScreen();

      case 1:
      scanListProvider.loadScanByType('http');
        return HistoryUrlsScreen();

      default:
        return HistoryMapsScreen();
    }
  }
}
