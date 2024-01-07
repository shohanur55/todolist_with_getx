import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_with_getx/views_part/nevigation_drawer.dart';
import 'package:todolist_with_getx/Controllers_part/todoController.dart';
import 'inputScreen.dart';

class MyHomePage extends StatelessWidget {
  TodoController controller = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Todo List"),
          centerTitle: true,
          backgroundColor: Colors.purpleAccent,
        ),
        drawer: NDrawer(),
        body: Obx(() {
          return controller.noteslist.isNotEmpty
              ? ListView.builder(
                  itemCount: controller.noteslist.length,
                  itemBuilder: (context, index) {
                    final note = controller.noteslist[index];
                    return Card(
                  //  key:ValueKey(controller.noteslist[index]),

                      child: GestureDetector(
                        //update operation
                        onTap: () {
                          Get.to(() => InputScreen(
                                id: note.id,
                                is_edit: true,
                              ));
                        },

                        child: ListTile(
                          tileColor: Colors.cyan,
                          title: Text(note.title.toString(),
                              style: TextStyle(fontSize: 22)),
                          subtitle: Text(note.description.toString(),
                              style: TextStyle(fontSize: 18)),
                          leading: GestureDetector(
                            onTap: () async {

                              if (note.id != null) {
                                await controller.dbhandler.deleteOp(note.id);
                               // controller.noteslist.remove(note);
                              }
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 30,
                            ),
                          ),
                          trailing: Text(note.dates.toString(),
                              style: TextStyle(fontSize: 25)),
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text(
                    'no data found',
                    style: TextStyle(fontSize: 35),
                  ),
                );
        }),
        floatingActionButton: FloatingActionButton.extended(
          label: Text(
            "Add List",
            style: TextStyle(color: Colors.cyan, fontSize: 28),
          ),
          onPressed: () {
            controller.titleController.clear();
            controller.descriptionController.clear();
            Get.to(() => InputScreen());
          },
        ),
      ),
    );
  }
}
