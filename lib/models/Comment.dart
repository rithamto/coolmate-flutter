import 'package:coolmate/models/Product.dart';
import 'package:firebase_database/firebase_database.dart';

class Comment {
  final String comment, uid, image, tenkh;

  Comment({
    required this.comment,
    required this.uid,
    required this.image,
    required this.tenkh,
  });
  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    comment : json["comment"],
    uid : json["id"],
    image : json["image"],
    tenkh : json["tenKhachhang"],
   );
  
  Map<String, dynamic> toJson() => {
    "comment" : comment,
    "id" : uid,
    "image" : image,
    "tenkhachhang" : tenkh,
  };
}