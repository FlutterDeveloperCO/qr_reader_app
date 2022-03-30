import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
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
