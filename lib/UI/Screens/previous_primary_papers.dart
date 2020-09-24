import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lpchub/utils/colors.dart';
import 'pdf_page.dart';

class PreviousPrimaryPapers extends StatelessWidget {
  bool buttonPressed;
  final String sectionName;
  PreviousPrimaryPapers({this.sectionName});
  PdfPages pdf;

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
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('previous_year_papers')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.data == null)
                  return Text(
                    'Loading...',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  );
                List<PaperTitlePanel> panels = [];
                final details = snapshot.data.documents;
                for (var detail in details) {
                  final title = detail.data()["title"];
                  final link = detail.data()["link"];
                  if (detail.data()["section"] == sectionName) {
                    final paperTitlePanel = PaperTitlePanel(
                      title: title,
                      onTap: (){
                        pdf=PdfPages(
                          url: link,
                        );
                        Navigator.push(context,
                        MaterialPageRoute(
                            builder:((context)=>pdf)
                        )
                        );
                      },
                    );
                    panels.add(paperTitlePanel);
                  }
                }

                return Expanded(
                  child: ListView(
                    children: panels.isEmpty?
                    [
                      SizedBox(
                        height: 10.0,
                      ),
                          Center(
                            child: Text(
                              'Nothing found',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 25.0),
                            ),
                          )
                    ]
                        : panels,
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

class PaperTitlePanel extends StatefulWidget {
  final Color color;
  final String title;
  final Function onTap;
  const PaperTitlePanel({this.color = Colors.red, this.title, this.onTap});

  @override
  _PaperTitlePanelState createState() => _PaperTitlePanelState();
}

class _PaperTitlePanelState extends State<PaperTitlePanel> {
  bool buttonPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails d) {
        setState(() {
          buttonPressed = true;
        });
      },
      onTapUp: (TapUpDetails d) {
        setState(() {
          buttonPressed = false;
        });
      },
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(12.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: buttonPressed ? Colors.black : widget.color,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              border: Border.all(
                color: buttonPressed ? appOrange : Colors.white,
                width: 3.0,
              )),
          child: Text(
            widget.title,
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
