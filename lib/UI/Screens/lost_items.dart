import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lpchub/ui_components/lost_items_label.dart';
import 'package:lpchub/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';

class LostItems extends StatelessWidget {

  final storage = FirebaseDatabase.instance;
  void getUrl() async{
    var url = await storage.reference().child("images/handkerchief.jpeg");

  print(' url :$url');
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryAppColor,
        appBar: AppBar(
          backgroundColor: appOrange,
          title: Center(
            child: Text(
              'Lost Items',
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
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('lost_items').snapshots(),
                    builder: (context,snapshot){
                      if(!snapshot.hasData) return Center(child: Text('Loading...',style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),),);
                      print(snapshot.data.documents.length);
                      var labelParameters=snapshot.data.documents;
                      List<LostItemsLabel> labels=[];
                      for(var labelparameter in labelParameters){
                        final itemName = labelparameter.data()["item_name"];
                        final itemColor= labelparameter.data()["item_color"];
                        final extraIdentity = labelparameter.data()["extra_identity"];
                        final foundSpot = labelparameter.data()["found_spot"];
                        final link = labelparameter.data()["link"];
                        getUrl();
                        final label = LostItemsLabel(
                          link: link,
                          itemName: itemName,
                          itemColor: itemColor,
                          extraIdentity: extraIdentity,
                          foundSpot: foundSpot,
                        );
                          labels.add(label);
                      }
                      return ListView(
                        children: labels,
                      );
                    },
                ),
            ),
          ],
        ),
      ),
    );
  }
}
