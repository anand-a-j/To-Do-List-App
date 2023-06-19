// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_list_app/DB/model/DataModel.dart';

ValueNotifier<List<ItemModel>> itemListNotifer = ValueNotifier([]);

Future<void> addItem(ItemModel value) async {
  final itemDB = await Hive.openBox<ItemModel>('item_db');
  itemDB.add(value);
  // ignore: invalid_use_of_protected_member
  itemListNotifer.notifyListeners();
  getAllItems();
}

Future<void> getAllItems() async {
  final itemDB = await Hive.openBox<ItemModel>('item_db');
  itemListNotifer.value.clear();
  itemListNotifer.value.addAll(itemDB.values);
  // ignore: invalid_use_of_protected_member
  itemListNotifer.notifyListeners();
}

Future<void> deleteItem(int index) async {
  final itemDB = await Hive.openBox<ItemModel>('item_db');
  await itemDB.deleteAt(index);
  getAllItems();
}

Future<void> updateItem(int index, ItemModel value) async {
  final itemDB = await Hive.openBox<ItemModel>('item_db');
  await itemDB.putAt(index, value);
  getAllItems();
}
