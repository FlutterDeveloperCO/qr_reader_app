import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier{

  int _selectedIndex = 1;

  int get selectedIndex {
    return _selectedIndex;
  }

  set selectedIndex(int index){
    _selectedIndex = index;
    notifyListeners();
  }
}