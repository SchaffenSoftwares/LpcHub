import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lpchub/UI/Screens/previous_primary_papers.dart';
import 'package:lpchub/utils/colors.dart';

class PreviousYearPapers extends StatefulWidget {

  @override
  _PreviousYearPapersState createState() => _PreviousYearPapersState();
}

class _PreviousYearPapersState extends State<PreviousYearPapers> {
  bool button1Pressed= false,button2Pressed=false,button3Pressed=false;
  String primary= "primary", middle = "middle", senior = "senior";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: primaryAppColor,
          appBar: AppBar(
            backgroundColor: appOrange,
            title: Center(
              child: Text(
                'Previous Year Papers',
                style: GoogleFonts.alata(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          body: Container(
            child: Column(
              children: [

                Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 20.0),
                  width: MediaQuery.of(context).size.width,
                  child: Text('Select section',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                  ),
                  ),
                ),

                GestureDetector(
                  onTapDown: (TapDownDetails d){
                    setState(() {
                      button1Pressed=true;
                    });
                  },
                  onTapUp: (TapUpDetails d){
                    setState(() {
                      button1Pressed=false;
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>PreviousPrimaryPapers(sectionName: primary,),
                      ));
                    });
                  },
                  child: SectionPanel(
                    color: button1Pressed?appOrange:Color(0xffd90429),
                    title: 'Primary Section',
                  ),
                ),

                GestureDetector(
                  onTapDown: (TapDownDetails d){
                    setState(() {
                      button2Pressed=true;
                    });
                  },
                  onTapUp: (TapUpDetails d){
                    setState(() {
                      button2Pressed=false;
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>PreviousPrimaryPapers(sectionName: middle,),
                      ));
                    });
                  },
                  child: SectionPanel(
                    color:  button2Pressed?Colors.black:Color(0xffe09f3e),
                    title: 'Middle Section',
                  ),
                ),
                
                GestureDetector(
                  onTapDown: (TapDownDetails d){
                    setState(() {
                      button3Pressed=true;
                    });
                  },
                  onTapUp: (TapUpDetails d){
                    setState(() {
                      button3Pressed=false;
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>PreviousPrimaryPapers(sectionName: senior,),
                      ));
                    });
                  },
                  child: SectionPanel(
                    color:  button3Pressed?Colors.black:Color(0xff284b63),
                    title: 'Senior Section',
                  ),
                ),

              ],
            ),
          ),
        ),
    );
  }
}

class SectionPanel extends StatelessWidget {

  final Color color;
  final String title;

  const SectionPanel({this.color,this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 15.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 12.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          border: Border.all(
              color: Colors.white,
              width: 3.0
          ),
        ),
        width: MediaQuery.of(context).size.width,
        child: Text(title,
          style: TextStyle(
              color: Colors.white,
              fontSize: 25.0
          ),
        ),
      ),
    );
  }
}
