import 'package:flutter/material.dart';
import 'package:todo_list_app/screens/updateitem_screen.dart';
import '../DB/functions/db_functions.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: itemListNotifer,
      builder: (ctx, itemList, _) {
        return ListView.separated(
            itemBuilder: (context, index) {
              final data = itemList[index];
              return ListTile(
                onLongPress: () {
                  updateItemBottomSheet(context, index, data.item);
                },
                title: Text(data.item),
                trailing: IconButton(
                    onPressed: () {
                      deleteItem(index);
                    },
                    icon: const Icon(Icons.close)),
              );
            },
            separatorBuilder: (ctx, index) {
              return const SizedBox(height: 5);
            },
            itemCount: itemList.length);
      },
    );
  }
}
