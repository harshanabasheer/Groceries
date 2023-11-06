import 'package:flutter/cupertino.dart';

class Provider_class extends ChangeNotifier{
  String _itemText = '';
  List _items = [];
  String get itemText => _itemText;
  List get items => _items;

  void updateItemText(String newText) {
    _itemText = newText;
    notifyListeners();
  }
  void addItem() {
    _items.add(_itemText);
    _itemText = '';
    notifyListeners();
  }
}