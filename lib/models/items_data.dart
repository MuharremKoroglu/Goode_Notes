import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'items.dart';

class ItemsData with ChangeNotifier {
  final List<Items> _notes = [];
  UnmodifiableListView<Items> get items => UnmodifiableListView(_notes);

  static var _sharedPref;
  List<String> _itemsAsString = [];

  void toggleStatus(int index) {
    _notes[index].toogleStatus();
    saveItemsToSharePref(_notes);
    notifyListeners();
  }

  void addItem(String title) {
    _notes.add(
      Items(title: title),
    );
    saveItemsToSharePref(_notes);
    notifyListeners();
  }

  void deleteItems(int index) {
    _notes.removeAt(index);
    saveItemsToSharePref(_notes);
    notifyListeners();
  }

  Future<void> createSharedPrefObject() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

  void saveItemsToSharePref(List<Items> notes) {
    _itemsAsString.clear();
    for (var item in notes) {
      _itemsAsString.add(json.encode(item.toMap()));
    }

    _sharedPref.setStringList('toDoData', _itemsAsString);
  }

  void loadItemsFromSharedPref() {
    List<String> tempList = _sharedPref.getStringList('toDoData') ?? [];
    _notes.clear();
    for (var item in tempList) {
      _notes.add(Items.fromMap(json.decode(item)));
    }
  }
}
