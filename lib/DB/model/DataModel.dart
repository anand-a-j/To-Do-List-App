import 'package:hive_flutter/hive_flutter.dart';
part 'DataModel.g.dart';

@HiveType(typeId: 1)
class ItemModel extends HiveObject {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String item;

  ItemModel({required this.item,this.id});
}
