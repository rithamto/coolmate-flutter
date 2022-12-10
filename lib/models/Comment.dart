import 'package:coolmate/models/Product.dart';
import 'package:firebase_database/firebase_database.dart';

class Comment {
  late String comment, uid, image, tenkh;

  Comment.fromMap(Map<dynamic, dynamic> data){
    comment = data["comment"];
    uid = data["id"];
    image = data["image"];
    tenkh = data["tenKhachhang"];
  }
  
  Map<String, dynamic> toJson() => {
    "comment" : comment,
    "id" : uid,
    "image" : image,
    "tenkhachhang" : tenkh,
  };
}