import 'package:flutter/material.dart';
import 'package:lpchub/UI/Screens/settings.dart';
import 'package:lpchub/UI/Screens/humans_of_lpc.dart';


class GridDashboard extends StatelessWidget {

  static String circulars = "Circulars",
      previousYearPapers = "Previous Years Papers",
      humansOfLpc = "Humans of Lpc",
      bunkZone = "Bunk Zone",
      lostItems = "Lost Items",
      scootyPool = "Scooty Pool",
      todoList = "To-Do List",
      settings = "Settings";

  Items item1 = new Items(
      title: GridDashboard.humansOfLpc,
      img: "assets/settings.png");

  Items item2 = new Items(
    title: GridDashboard.settings,
    img: "assets/setting.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2];
    var color = 0xFFFB8C00;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return GestureDetector(
              onTap: (){
                if (data.title.compareTo(GridDashboard.humansOfLpc) == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HumansOfLpc();
                      },
                    ),
                  );
                } else if(data.title.compareTo(GridDashboard.settings)==0){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Settings();
                      },
                    ),
                  );
                }
              },
              child: Container(

                decoration: BoxDecoration(
                    color: Color(color), borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      data.img,
                      width: 50,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(data.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}


class Items {
  String title;
  String img;
  Items({this.title,  this.img});
}