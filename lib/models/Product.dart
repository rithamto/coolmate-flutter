import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coolmate/models/Comment.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Product {
  late String Ten, mota, danhmuc, giatien;
  late List<String> hinhanh;
  late List<int> mau;
  late List<Comment> cmt;
  late double rating;
  late bool isFavourite, isPopular;

  // Product({
  //   required this.hinhanh,
  //   required this.mau,
  //   required this.Ten,
  //   required this.mota,
  //   required this.cmt,
  //   required this.danhmuc,
  //   required this.giatien,
  //   required this.rating,
  //   this.isFavourite = false,
  //   this.isPopular = false,
  // });

  //  factory Product.fromJson(Map<String, dynamic> json) => Product(
  //   hinhanh : List<String>.from(json["HinhAnh"]),
  //   mau : List<int>.from(json["mau"]),
  //   Ten : json["Ten"],
  //   mota : json["MoTa"],
  //   cmt : List<Comment>.from(json["Comment"].map((x) => Comment.fromJson(x))),
  //   danhmuc : json["danhMuc"],
  //   giatien : json["Giatien"],
  //   rating : json["rating"],
  //   isFavourite : json["isFavourite"],
  //   isPopular : json["isPopular"],
  //  );
  // Map<String, dynamic> toJson() => {
  //   "HinhAnh": List<dynamic>.from(hinhanh),
  //   "mau": List<dynamic>.from(mau),
  //   "Ten": Ten,
  //   "MoTa": mota,
  //   "Comment":List<dynamic>.from(cmt.map((x) => x.toJson())),
  //   "danhMuc": danhmuc,
  //   "Giatien": giatien,
  //   "rating": rating,
  //   "isFavourite": isFavourite,
  //   "isPopular": isPopular,
  // };  

  Product.fromMap(Map<String,dynamic> data){
    hinhanh = data['HinhAnh'];
    mau = data['mau'];
    Ten = data['Ten'];
    mota = data['Mota'];
    cmt = data['Comment'];
    danhmuc = data['danhMuc'];
    giatien = data['Giatien'];
    rating = data['rating'];
    isFavourite = data['isFavourite'];
    isPopular = data['isPopular'];
  }

}

Future<List<Product>> getProduct() async{
  List<Product> _product = [] ;
  final snapshot = await FirebaseFirestore.instance.collection('Product').get();
  snapshot.docs.forEach((document) {
    Product product = Product.fromMap(document.data());
    _product.add(product);
  });
  return _product;
}

List<Product> product = [];





