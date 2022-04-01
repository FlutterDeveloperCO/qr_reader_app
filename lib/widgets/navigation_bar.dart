import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedIndex;

    return BottomNavigationBar(
      onTap: (int i){
        uiProvider.selectedIndex = i;
      },
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.location_on_rounded), 
            label: 'Map'),
        BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration_rounded), 
            label: 'URLs'),
      ],
    );
  }
}
