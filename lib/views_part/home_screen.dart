import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_with_getx/views_part/nevigation_drawer.dart';
import 'package:todolist_with_getx/Controllers_part/todoController.dart';
import 'color & style part/cfolor_style.dart';
import 'inputScreen.dart';

class MyHomePage extends StatelessWidget {
  TodoController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Todo List",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFF6FEF9),
                  Color(0xFFFFFFFF), // Second color
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        drawer: NDrawer(),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "lib/assets/images/unnamed.png",
                  ),
                  fit: BoxFit.cover)),
          child: Obx(() {
            return controller.noteslist.isNotEmpty
                ? ListView.builder(
                    itemCount: controller.noteslist.length,
                    itemBuilder: (context, index) {
                      final note = controller.noteslist[index];
                      return Card(
                        margin: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        elevation: 0.5,
                        child: GestureDetector(
                          //update operation
                          onTap: () {
                            Get.to(() => InputScreen(
                                  id: note.id,
                                  is_edit: true,
                                ));
                          },
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 14),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0)),
                            tileColor: Theme.of(context).cardColor,
                            title: Text(
                              note.title.toString(),
                              style: titleStyle1,
                            ),
                            subtitle: Text(
                              note.dates.toString(),
                             style: dateStyle1,
                            ),
                            leading: GestureDetector(
                              onTap: () async {
                                if (note.id != null) {
                                  await controller.dbhandler.deleteOp(note.id);
                                }
                              },
                              child: Icon(
                                Icons.delete,
                                // color: Colors.red,
                                size: 30,
                              ),
                            ),
                            trailing: GestureDetector(
                              onTap: (){
                               Get.defaultDialog(
                                 title: note.title.toString(),
                                 titleStyle: titleStyle1,
                                 middleText: note.description.toString(),
                               );
                              },
                              child: Icon(
                                Icons.arrow_drop_down_sharp,
                                size: 50,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text(
                      'No data found',
                      style: TextStyle(
                        fontSize: 35,
                        //color: Colors.red
                      ),
                    ),
                  );
          }),
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: Text(
            "Add List",
            style: TextStyle(


                fontSize: 24),
          ),
          backgroundColor: Theme.of(context).colorScheme.outline,
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
