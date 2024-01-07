import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_with_getx/Controllers_part/todoController.dart';

class NDrawer extends StatelessWidget {
  TodoController c=Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.purpleAccent,
      child:Obx(
              () {
            return c.noteslist.isNotEmpty ?
            ListView.builder(
              itemCount: c.noteslist.length,
              itemBuilder: (context, index) {
                final note = c.noteslist[index];
                return Card(
                  child: ListTile(
                    tileColor: Colors.amber,
                    title: Text(note.title.toString()),
                    leading: Text(note.dates.toString()),
                  ),
                );
              },
            )
                : Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}





