import 'package:flutter/material.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
      title: "Circulars",

      img: "assets/circular.png");

  Items item2 = new Items(
    title: "Previous Years Papers",

    img: "assets/exam.png",
  );
  Items item3 = new Items(
    title: "Humans of Lpc",

    img: "assets/settings.png",
  );
  Items item4 = new Items(
    title: "Bunk Zone",

    img: "assets/festival.png",
  );
  Items item5 = new Items(
    title: "Lost Items",
    img: "assets/lost.jpg",
  );
  Items item6 = new Items(
    title: "Scooty Pool",
    img: "assets/pool.png",
  );
  Items item7 = new Items(
    title: "To-Do List",
    img: "assets/todo.png",
  );
  Items item8 = new Items(
    title: "Settings",
    img: "assets/setting.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6, item7, item8];
    var color = 0xFFFB8C00;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Container(
              decoration: BoxDecoration(
                  color: Color(color), borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    child: Image.asset(
                      data.img,
                      width: 120,
                    ),
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