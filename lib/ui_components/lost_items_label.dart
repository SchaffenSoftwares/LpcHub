import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lpchub/utils/colors.dart';

class LostItemsLabel extends StatelessWidget {

  final String itemName,itemColor,extraIdentity,foundSpot,link;

  const LostItemsLabel({this.itemName, this.itemColor,this.extraIdentity, this.foundSpot,this.link=''});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      child: Container(
        width: double.infinity,
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          border: Border.all(
            color: appOrange,
            width: 2.0,
          ),
        ),
        child:Row(
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width * 0.27,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: link!=null?Image(
                  image: NetworkImage(
                     link
                  ),
              ):null,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 2.0),
              child: VerticalDivider(
                thickness: 3.0,
                color: appOrange,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 12.0,bottom: 5.0,left: 5.0),
                  child: Row(
                    children: [
                      Text('Item Name:',
                        style: GoogleFonts.notoSans(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        itemName,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Item Desc:',
                        style: GoogleFonts.notoSans(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '''$itemColor,\n$extraIdentity''',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
                  child: Row(
                    children: [
                      Text('Found At:',
                        style: GoogleFonts.notoSans(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        ' $foundSpot',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
