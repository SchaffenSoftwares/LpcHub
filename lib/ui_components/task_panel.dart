import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskPanel extends StatefulWidget {

  final String taskTitle, description;
  final int colorCode;
  final Function delBtnPressed;

  const TaskPanel({this.taskTitle,this.delBtnPressed,this.description,this.colorCode=1});

  @override
  _TaskPanelState createState() => _TaskPanelState();
}

class _TaskPanelState extends State<TaskPanel> {
  @override
  Widget build(BuildContext context) {
    List mainColors=[Color(0xff2ec4b6),Color(0xff7b2cbf),Color(0xffe71d36)],
        upperShadows=[Color(0xff27a79b),Color(0xff6925a2),Color(0xffc4192e)],
        lowerShadows=[Color(0xff35e1d1),Color(0xff8d33dc),Color(0xffff213e)];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 15.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        decoration: BoxDecoration(
          color: mainColors[widget.colorCode],
          borderRadius: BorderRadius.all(Radius.circular(25.0),),
        ),
        child: Container(
          child: Column(
            children: [
              Text(widget.taskTitle,
                style: GoogleFonts.paytoneOne(
                    color: Colors.white,
                    fontSize: 30.0
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Desc:',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: 150.0,
                          child: Text('''${widget.description}''',
                            style: TextStyle(
                              color: Colors.white,
                            ),),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10.0),
                          child: Container(
                            height: 50.0,
                            width: 80.0,
                            decoration: BoxDecoration(
                              color: mainColors[widget.colorCode],
                              borderRadius: BorderRadius.all(Radius.circular(8.0),),
                              boxShadow: [
                                BoxShadow(
                                  color: upperShadows[widget.colorCode],
                                  offset: Offset(5.0,5.0),
                                  blurRadius: 10.0,
                                  spreadRadius: 1.0,
                                ),
                                BoxShadow(
                                  color: lowerShadows[widget.colorCode],
                                  offset: Offset(-5.0,-5.0),
                                  blurRadius: 10.0,
                                  spreadRadius: 1.0,
                                ),
                              ],

                            ),
                            child: Icon(Icons.delete,
                              color: Colors.white,),
                          ),
                        ),
                        onTap: widget.delBtnPressed,
                      ),
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                          child: Container(
                            height: 50.0,
                            width: 80.0,
                            decoration: BoxDecoration(
                              color: mainColors[widget.colorCode],
                              borderRadius: BorderRadius.all(Radius.circular(8.0),),
                              boxShadow: [
                                BoxShadow(
                                  color: upperShadows[widget.colorCode],
                                  offset: Offset(5.0,5.0),
                                  blurRadius: 10.0,
                                  spreadRadius: 1.0,
                                ),
                                BoxShadow(
                                  color: lowerShadows[widget.colorCode],
                                  offset: Offset(-5.0,-5.0),
                                  blurRadius: 10.0,
                                  spreadRadius: 1.0,
                                ),
                              ],
                            ),
                            child: Icon(Icons.done_outline,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onTap: widget.delBtnPressed,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
