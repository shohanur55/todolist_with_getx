import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_with_getx/views_part/nevigation_drawer.dart';
import 'package:todolist_with_getx/Controllers_part/todoController.dart';
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
          toolbarHeight: 80,
          centerTitle: true,
          //automaticallyImplyLeading: false, // Hide the back button
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFEEA00), Color(0xFF64B5F6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        drawer: NDrawer(),
        backgroundColor: Colors.yellow.shade100,
        body: Obx(() {
          return controller.noteslist.isNotEmpty
              ? ListView.builder(
            itemCount: controller.noteslist.length,
            itemBuilder: (context, index) {
              final note = controller.noteslist[index];
              return Card(
                elevation: 5,
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: GestureDetector(
                  //update operation
                  onTap: () {
                    Get.to(() => InputScreen(
                      id: note.id,
                      is_edit: true,
                    ));
                  },
                  child: ListTile(
                    tileColor: Colors.tealAccent,
                    title: Text(
                      note.title.toString(),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      note.description.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[800],
                      ),
                    ),
                    leading: GestureDetector(
                      onTap: () async {
                        if (note.id != null) {
                          await controller.dbhandler.deleteOp(note.id);
                        }
                      },
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                    trailing: Text(
                      note.dates.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
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
              style: TextStyle(fontSize: 35, color: Colors.red),
            ),
          );
        }),
        floatingActionButton: FloatingActionButton.extended(
          label: Text(
            "Add List",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          backgroundColor: Colors.teal,
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


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:todolist_with_getx/views_part/nevigation_drawer.dart';
// import 'package:todolist_with_getx/Controllers_part/todoController.dart';
// import 'inputScreen.dart';
//
// class MyHomePage extends StatelessWidget {
//   TodoController controller = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Todo  List",style: TextStyle(fontSize: 40),),
//           toolbarHeight: 80,
//           centerTitle: true,
//       automaticallyImplyLeading: false, // Hide the back button
//       backgroundColor: Colors.transparent,
//       flexibleSpace: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF2ecc71), Color(0xFF3498db)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//
//           // backgroundColor: Colors.purpleAccent,
//         ),
//       ),
//         ),
//         drawer: NDrawer(),
//         body: Obx(() {
//           return controller.noteslist.isNotEmpty
//               ? ListView.builder(
//                   itemCount: controller.noteslist.length,
//                   itemBuilder: (context, index) {
//                     final note = controller.noteslist[index];
//                     return Card(
//                   //  key:ValueKey(controller.noteslist[index]),
//
//                       child: GestureDetector(
//                         //update operation
//                         onTap: () {
//                           Get.to(() => InputScreen(
//                                 id: note.id,
//                                 is_edit: true,
//                               ));
//                         },
//
//                         child: ListTile(
//                           tileColor: Colors.cyan,
//                           title: Text(note.title.toString(),
//                               style: TextStyle(fontSize: 22)),
//                           subtitle: Text(note.description.toString(),
//                               style: TextStyle(fontSize: 18)),
//                           leading: GestureDetector(
//                             onTap: () async {
//
//                               if (note.id != null) {
//                                 await controller.dbhandler.deleteOp(note.id);
//                                // controller.noteslist.remove(note);
//                               }
//                             },
//                             child: Icon(
//                               Icons.delete,
//                               color: Colors.red,
//                               size: 30,
//                             ),
//                           ),
//                           trailing: Text(note.dates.toString(),
//                               style: TextStyle(fontSize: 25)),
//                         ),
//                       ),
//                     );
//                   },
//                 )
//               : Center(
//                   child: Text(
//                     'no data found',
//                     style: TextStyle(fontSize: 35),
//                   ),
//                 );
//         }),
//         floatingActionButton: FloatingActionButton.extended(
//           label: Text(
//             "Add List",
//             style: TextStyle(color: Colors.cyan, fontSize: 28),
//           ),
//           onPressed: () {
//             controller.titleController.clear();
//             controller.descriptionController.clear();
//             Get.to(() => InputScreen());
//           },
//         ),
//       ),
//     );
//   }
// }
