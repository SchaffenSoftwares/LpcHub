import 'dart:ui';

var pageList = [
  PageModel(
      imageUrl: "assets/illustration.png",
      title: "Circulars",
      body: "GET ALL THE CIRCULARS OF LPC ON YOUR MOBILE",
      titleGradient: [Color(0xFF9708CC), Color(0xFF43CBFF)]),
  PageModel(
      imageUrl: "assets/illustration2.png",
      title: "ScootyPool",
      body: "DON'T RIDE ALONE TO SCHOOL, POOL YOUR SCOOTY SAVE FUEL SAVE WORLD",
      titleGradient: [Color(0xFFE2859F), Color(0xFFFCCF31)]),
  PageModel(
      imageUrl: "assets/illustration3.png",
      title: "StarKids",
      body: "WEEKLY INTERVIEW OF SENIORS, KNOW ABOUT THEM WHAT THEY ARE DOING AND WHERE THEY ARE NOW",
      titleGradient: [Color(0xFF5EFCE8), Color(0xFF736EFE)]),
];

class PageModel {
  String imageUrl;
  String title;
  String body;
  List<Color> titleGradient = [];
  PageModel({this.imageUrl, this.title, this.body, this.titleGradient});
}