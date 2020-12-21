import 'package:flutter/foundation.dart';

class AppState with ChangeNotifier {
  int _indexOfSelectedTab = 0;
  int get indexOfSelectedTab => _indexOfSelectedTab;
  set indexOfSelectedTab(int newValue) {
    _indexOfSelectedTab = newValue;
    notifyListeners();
  }

  int _indexOfSelectedItem = 0;

  int get indexOfSelectedItem => _indexOfSelectedItem;
  set indexOfSelectedItem(int newIndex) {
    _indexOfSelectedItem = newIndex;
    notifyListeners();
  }

  bool _isClicked = false;
  bool get isClicked => _isClicked;
  set isClicked(bool clicked) {
    _isClicked = clicked;
    notifyListeners();
  }

  
}
