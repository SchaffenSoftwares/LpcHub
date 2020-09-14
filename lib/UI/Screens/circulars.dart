import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lpchub/utils/colors.dart';
import 'dart:math';
import 'pdf_page.dart';


class Circulars extends StatefulWidget {
  @override
  _CircularsState createState() => _CircularsState();
}

class _CircularsState extends State<Circulars> {

  PdfPages pdf;
  Random random;
  int i =0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryAppColor,
        appBar: AppBar(
          backgroundColor: appOrange,
          title: Center(
            child: Text(
              'Circulars',
              style: GoogleFonts.alata(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('circulars').snapshots(),
                  builder: (context,snapshot){
                    if(!snapshot.hasData){
                      return Center(
                        child: Text('Loading...',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        ),
                        ),
                      );
                    }
                    List<GestureDetector> circularsList = [];
                    snapshot.data.docs.forEach((document){
                      final date = document.data()["date"];
                      final title = document.data()["title"];
                      final link = document.data()["pdf_link"];
                      i++;
                      final circularLink =
                      GestureDetector(
                        child: CircularLink(
                          colorCode: i%4,
                          titleMessge: title,
                          date: date,
                        ),
                        onTap: (){
                          print('pdf');
                          Navigator.push(context,
                          MaterialPageRoute(
                            builder: ((context){
                              pdf = PdfPages(
                                url: link,
                              );
                              return pdf;
                            })
                          )
                          );
                        },
                      );
                      circularsList.add(circularLink);
                    });
                    return ListView(
                      children: circularsList,
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class CircularLink extends StatefulWidget {

  final String date,titleMessge,link;
  final int colorCode;

  const CircularLink({this.date,this.titleMessge,this.colorCode=4,this.link});


  @override
  _CircularLinkState createState() => _CircularLinkState();
}

class _CircularLinkState extends State<CircularLink> {
  @override
  Widget build(BuildContext context) {
    List myColors=[Color(0xff3c6e71),Color(0xff284b63),Color(0xffd90429),Color(0xffe09f3e),Color(0xffeb5e28)];
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0,horizontal: 10.0),
        child: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40.0,
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                    bottomRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0)),
                border: Border.all(
                  color: Colors.white,
                  width: 3.0,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(widget.date,
                      style: TextStyle(
                        color: Colors.white,
                      ),),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.0),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100.0,
              decoration: BoxDecoration(
                color: myColors[widget.colorCode],
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
                border: Border.all(
                  color: Colors.white,
                  width: 3.0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        '''${widget.titleMessge}''',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
