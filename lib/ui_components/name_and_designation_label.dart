import 'package:flutter/material.dart';
import 'package:lpchub/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class NameAndDesignationLabel extends StatelessWidget {

  final String firstName,lastName,jobRole,companyName,jobCity,jobCountry,imageLink;

  const NameAndDesignationLabel({this.firstName, this.lastName, this.jobRole, this.companyName, this.jobCity, this.jobCountry='',this.imageLink});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: ((MediaQuery.of(context).size.width)*1)/3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.red,
            ),
            child: imageLink.isNotEmpty?Image(image: NetworkImage(
              imageLink
            )):Center(child: Text(
              'N/A',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
              ),
            ),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 5.0),
          child: VerticalDivider(
            color: appOrange,
            thickness: 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0,top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Column For nameTag
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(firstName,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                  Text(lastName,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),

                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 7.0),
                child: Text('''$jobRole, \n$companyName''',
                  style: GoogleFonts.imFellDoublePica(
                    fontSize: 13.0,
                    color: Colors.white,
                  ),
                ),
              ),

              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 12.0,
                  ),
                  Text(' $jobCity',
                    style: TextStyle(
                        color:Colors.white,
                        fontSize: 12.0
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
