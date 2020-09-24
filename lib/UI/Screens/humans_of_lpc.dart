import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lpchub/utils/colors.dart';
import 'package:lpchub/ui_components/name_and_designation_label.dart';
import 'package:lpchub/ui_components/title_and_description.dart';
import 'package:lpchub/repository/humans_of_lpc_details.dart';


class HumansOfLpc extends StatefulWidget {

  @override
  _HumansOfLpcState createState() => _HumansOfLpcState();
}

class _HumansOfLpcState extends State<HumansOfLpc> {
  String name,company,jobposition,location;
  PersonalDetails details =PersonalDetails();

  void getPersonDetails() async{
    var sn = await FirebaseFirestore.instance.collection('humansOfLpc').doc('personal_details')
    .get()
    .then((value){
      setState(() {
        details.first_name=value.data()["first_name"];
        details.last_name=value.data()["last_name"];
        details.location=value.data()["location"];
        details.jobRole=value.data()["job_role"];
        details.company=value.data()["company"];
        details.imageLink=value.data()["image_link"];
      });
      print('url');
      print(details.imageLink);
    })
    ;
  }
  @override
  void initState() {
    // TODO: implement initState
    getPersonDetails();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          backgroundColor: appOrange,
          title: Center(
            child: Text('Humans Of LPC',
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

                    Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 1.0),
                  child: Container(
                    width: double.infinity,
                    height: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      border: Border.all(
                        color: appOrange,
                      ),
                    ),
                    //Can be found in Ui_components/name_and_designation_label.dart
                    child: NameAndDesignationLabel(
                      firstName: details.first_name,
                      lastName: details.last_name,
                      jobRole: details.jobRole,
                      companyName: details.company,
                      jobCity: details.location,
                      imageLink:details.imageLink,
                    ),
                  ),
                ),

            SizedBox(
              height: 15.0,
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection('humansOfLpc').snapshots(),
              builder: (BuildContext context,snapshot){
                if(!snapshot.hasData){
                  return Center(
                    child: Text('Loading...',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  );
                }

                List<TitleAndDescription> titleAndDescriptions=[
                ];
                snapshot.data.docs.forEach((document){
                    final about = document.data()["desc1"];
                    final incampusProgress =document.data()["desc2"];
                    final afterCampusPlacement = document.data()["desc3"];
                    final aboutDesc = TitleAndDescription(
                      title: 'About',
                      description: about,
                    );
                    final incampusProgressDesc = TitleAndDescription(
                      title: 'In-Campus Progress',
                      description: incampusProgress,
                    );
                    final afterCampusPlacementDesc=TitleAndDescription(
                      title: 'After Campus Placements',
                      description: afterCampusPlacement,
                    );

                    titleAndDescriptions.add(aboutDesc);
                    titleAndDescriptions.add(incampusProgressDesc);
                    titleAndDescriptions.add(afterCampusPlacementDesc);

                });



                return Expanded(
                  child: ListView(
                    children: titleAndDescriptions,
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
