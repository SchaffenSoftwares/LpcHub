import 'package:flutter/material.dart';
import 'package:lpchub/UI/Screens/circulars.dart';
import 'package:lpchub/UI/Screens/humans_of_lpc.dart';
import 'package:lpchub/UI/Screens/lost_items.dart';
import 'package:lpchub/UI/Screens/previous_year_papers.dart';
import 'package:lpchub/UI/Screens/settings.dart';
import 'package:lpchub/UI/Screens/todo_list.dart';


class GridDashboard extends StatefulWidget {
  static String circulars = "Circulars",
      previousYearPapers = "Previous Years Papers",
      humansOfLpc = "Humans of Lpc",
      bunkZone = "Bunk Zone",
      lostItems = "Lost Items",
      scootyPool = "Scooty Pool",
      todoList = "To-Do List",
      settings = "Settings";


  @override
  _GridDashboardState createState() => _GridDashboardState();
}

class _GridDashboardState extends State<GridDashboard> {
  final comingSoonSnackBar= SnackBar(content: Center(child: Text('COMING SOON')));
  Items item1 =
      new Items(title: GridDashboard.circulars, img: "assets/circular.png");

  Items item2 = new Items(
    title: GridDashboard.previousYearPapers,
    img: "assets/exam.png",
  );

  Items item3 = new Items(
    title: GridDashboard.humansOfLpc,
    img: "assets/settings.png",
  );

  Items item4 = new Items(
    title: GridDashboard.bunkZone,
    img: "assets/festival.png",
  );

  Items item5 = new Items(
    title: GridDashboard.lostItems,
    img: "assets/lost.jpg",
  );

  Items item6 = new Items(
    title: GridDashboard.scootyPool,
    img: "assets/pool.png",
  );

  Items item7 = new Items(
    title: GridDashboard.todoList,
    img: "assets/todo.png",
  );

  Items item8 = new Items(
    title: GridDashboard.settings,
    img: "assets/setting.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [
      item1,
      item2,
      item3,
      item4,
      item5,
      item6,
      item7,
      item8
    ];
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
              child: GestureDetector(
                onTap: () {
                  if(data.title.compareTo(GridDashboard.circulars)==0){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Circulars();
                        },
                      ),
                    );
                  }
                  else if(data.title.compareTo(GridDashboard.previousYearPapers)==0){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context){
                            return PreviousYearPapers();
                          }
                        ),
                    );
                  }
                  else if (data.title.compareTo(GridDashboard.humansOfLpc) == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HumansOfLpc();
                        },
                      ),
                    );
                  }
                  else if(data.title.compareTo(GridDashboard.lostItems)==0){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LostItems();
                        },
                      ),
                    );
                  }
                  else if(data.title.compareTo(GridDashboard.todoList)==0){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TodoList();
                        },
                      ),
                    );
                  }
                  else if(data.title.compareTo(GridDashboard.settings)==0){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Settings();
                        },
                      ),
                    );
                  }
                  else if(data.title.compareTo(GridDashboard.bunkZone)==0 ||
                      data.title.compareTo(GridDashboard.scootyPool)==0
                  ){
                    Scaffold.of(context).showSnackBar(comingSoonSnackBar);
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    data.img=="assets/todo.png"?
                    InkWell(
                      child: Image.asset(
                        data.img,
                        width: 160,
                      ),
                    ):
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
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String img;
  Items({this.title, this.img});
}
