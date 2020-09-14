import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lpchub/utils/colors.dart';

class TitleAndDescription extends StatelessWidget {

  final String title, description;

  const TitleAndDescription({@required this.title, @required this.description});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
            style: TextStyle(
              fontSize: 27.0,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text('''$description,
                          ''',
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.0
            ),),
        ],
      ),
    );
  }
}
