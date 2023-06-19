import 'package:flutter/material.dart';
import 'package:todo_list_app/DB/functions/db_functions.dart';
import 'package:todo_list_app/DB/model/DataModel.dart';

final itemEditingController = TextEditingController();

Future<void> addItemBottomSheet(context) async {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      " Enter your item",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff7916ff)),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: itemEditingController,
                      autofocus: true,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel')),
                        ElevatedButton(
                            onPressed: () {
                              final item = itemEditingController.text.trim();
                              if (item.isEmpty) {
                                return;
                              }
                              final items = ItemModel(item: item);
                              addItem(items);
                              Navigator.pop(context);
                            },
                            child: const Text("ADD"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
