import 'package:flutter/material.dart';
import 'package:todo_list_app/DB/functions/db_functions.dart';
import 'package:todo_list_app/screens/additem_screen.dart';
import 'package:todo_list_app/screens/list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
   getAllItems();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TO DO LIST",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          ),
      ),
      body:const ListScreen(),
      backgroundColor:const Color(0xffF3F1FF),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            addItemBottomSheet(context);
          },
          backgroundColor:const Color(0xff5A03D5),
          child: const Icon(Icons.add),
          ),
    );
  }
}

   
