
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Database_part/dbHandler.dart';
import '../Models_part/model.dart';

class TodoController extends GetxController{
   late final Dbhandler dbhandler=Dbhandler();
  late final RxList noteslist =<noteModel>[].obs;
   final TextEditingController titleController =TextEditingController();
   final TextEditingController descriptionController = TextEditingController();


  @override
  void onInit() {
    super.onInit();
    loading();



  }

  void loading() async {
  noteslist.assignAll(await Dbhandler().retrieveData());
  }
/////////////////////////////////////////////////////////////////////////
  void setInitialValues({String? title, String? description}) {
    titleController.text = title ?? '';
    descriptionController.text = description ?? '';
  }





   insertInput(){
    dbhandler.insert(
      noteModel(
        dates:
        '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
        title: titleController.text,
        description: descriptionController.text,
      ),
    ).then(
          (value) {
        print("data added");
      },
    ).catchError(
          (error) {
        print("insert error is the " + error.toString());
      },
    );
  }

  updateInput({required int given_id}){
     controller.dbhandler.updateOp(
        noteModel(
          id: given_id,
          dates:
              '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
         title: titleController.text,
          description: descriptionController.text,
        ),
      ).then(
           (value) {
             print("update id = $given_id");
         print("data updated");
       },
     ).catchError(
           (error) {
         print("update error is the " + error.toString());
       },
     );
  }

}