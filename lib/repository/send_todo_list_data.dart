import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lpchub/authentication/user_details_for_reference.dart';

class TodoListData{

  var databaseRef = FirebaseFirestore.instance;
  
  final String title ;
  final String desc;
  TodoListData({this.title,this.desc});
  Future sendData() async{
    var ref = await databaseRef.collection('${Details.email}_todo_list_details')
    .add({
      "title": title,
      "desc" : desc,
    })
    ;
  }
}