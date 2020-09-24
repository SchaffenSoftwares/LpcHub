import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lpchub/UI/Screens/todo_list.dart';
import 'package:lpchub/utils/colors.dart';
import 'package:lpchub/repository/send_todo_list_data.dart';


class NewTodoListTask extends StatefulWidget {
  
  @override
  _NewTodoListTaskState createState() => _NewTodoListTaskState();
}

class _NewTodoListTaskState extends State<NewTodoListTask> {
  TodoListData data;

  String title, desc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: appOrange,
        title: Center(
          child: Text(
            'Add new task',
            style: GoogleFonts.alata(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
          ),
          Expanded(
              child: ListView(
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Enter Title:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.yellow,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter title',
                          ),
                          maxLength: 20,
                          maxLengthEnforced: true,
                            onChanged: (text){
                              setState(() {
                                title=text;
                              });
                            }
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Enter Desc:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.yellow,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter desc',
                          ),
                          onChanged: (text){
                            setState(() {
                            desc=text;
                            });
                          },
                          maxLength: 50,
                          maxLengthEnforced: true,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  FlatButton(
                    onPressed: (){
                      data = TodoListData(title: title, desc: desc);
                      data.sendData()
                      .whenComplete((){
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context)=>TodoList()
                        ));
                      })
                      ;
                    },
                    child: Container(
                      width: 220.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: appOrange,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: Center(
                        child: Text('Done',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}
