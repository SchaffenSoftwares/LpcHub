import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lpchub/UI/Screens/new_task_todo_list.dart';
import 'package:lpchub/authentication/user_details_for_reference.dart';
import 'package:lpchub/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:lpchub/ui_components/task_panel.dart';

class TodoList extends StatelessWidget {

  int colorCode=1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryAppColor,
        appBar: AppBar(
          backgroundColor: appOrange,
          title: Center(
            child: Text(
              'To-do List',
              style: GoogleFonts.alata(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey, //Color(0xff7b2cbf),
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NewTodoListTask()));
          },
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('${Details.email}_todo_list_details')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Center(
                    child: Text(
                      'Loading',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                  );
                }
                
                List<TaskPanel> panels = [];
                final details = snapshot.data.documents;

                for(var detail in details){
                  final title = detail.data()["title"];
                  final desc = detail.data()["desc"];
                  final id = detail.id;
                  colorCode=(colorCode+1)%2;
                  final panel = TaskPanel(
                    colorCode: colorCode,
                    taskTitle: title,
                    description: desc,
                    delBtnPressed: (){
                      try {
                        FirebaseFirestore.instance
                            .collection('${Details.email}_todo_list_details')
                            .doc('$id')
                            .delete();
                      } catch (e) {
                        print(e.toString());
                      }
                    },
                  );
                  panels.add(panel);
                }
                return Expanded(
                  child: ListView(
                    children: panels.isNotEmpty?panels:[
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                        child: Text(
                          'Nothing found',
                          style:
                          TextStyle(color: Colors.grey, fontSize: 25.0),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
