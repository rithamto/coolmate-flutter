import 'package:flutter/material.dart';

class Product {
  final String Ten, mota, danhmuc, giatien;
  final List<String> hinhanh;
  final List<Color> mau;
  final double rating;
  final bool isFavourite, isPopular;

  Product({
    required this.hinhanh,
    required this.mau,
    required this.Ten,
    required this.mota,
    required this.danhmuc,
    required this.giatien,
    required this.rating,
    this.isFavourite = false,
    this.isPopular = false,
  });
}
List<Product> product = [

];