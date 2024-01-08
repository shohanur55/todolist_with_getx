import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_with_getx/views_part/home_screen.dart';
import 'package:todolist_with_getx/Controllers_part/todoController.dart';

class InputScreen extends StatelessWidget {
  TodoController controller = Get.find();
  final bool is_edit;
  final int? id;
  // final String? titleFromScreen;
  // final String? descriptionFromScreen;

  InputScreen({
    Key? key,
    // this.titleFromScreen,
    // this.descriptionFromScreen,
    this.is_edit = false,
    this.id,
  }) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey();

      // If editing, set initial values from the existing note



  @override
  Widget build(BuildContext context) {

    if(is_edit){
      var note = controller.noteslist.firstWhere((n) => n.id == id);
      controller.setInitialValues(
        title: note.title,
        description: note.description,
      );
    }



    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(is_edit ? 'Update List' : 'Input page'),
          backgroundColor: Colors.cyanAccent,
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(padding: EdgeInsets.all(30)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: TextFormField(
                  controller: controller.titleController,
                  decoration: InputDecoration(
                    hintText: "Title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.teal, // You can set the border color here
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.teal, // You can set the border color here
                        width: 2.0,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return 'Invalid Task';
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: TextFormField(
                  controller: controller.descriptionController,
                  decoration: InputDecoration(
                    hintText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.teal, // You can set the border color here
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.teal, // You can set the border color here
                        width: 2.0,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.multiline,
                  minLines: 5,
                  maxLines: 8,
                  validator: (value) {
                    if (value!.isEmpty) return 'Invalid Task';
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;
                  is_edit
                      ? controller.updateInput(given_id: id!)
                      : controller.insertInput();
                  Get.off(() => MyHomePage());

                },
                child: Text(is_edit ? 'Update' : 'Submit',
                    style: TextStyle(fontSize: 30, color: Colors.cyan)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
