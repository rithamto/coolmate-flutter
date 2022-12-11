import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:coolmate/components/product_card.dart';
import 'package:coolmate/models/Product.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatefulWidget {
  const PopularProducts({Key? key}) : super(key : key);
  
  @override
  State<StatefulWidget> createState() => _PopularProduct();
}

class _PopularProduct extends State<PopularProducts>{ 
Future convertList() async{    
  final snapshot = await FirebaseFirestore.instance.collection('Product').get();
  snapshot.docs.forEach((document) {
    Product products = Product.fromMap(document.data());
    product.add(products);
  });
}

  @override
  void initState(){
    convertList();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: FutureBuilder(future: convertList(),
          builder: (context, snapshot) {
            return Row(
              children: [
              ...List.generate(product.length,(index) {
              if (product[index].isPopular)
                return ProductCard(product: product[index]);
                return SizedBox.shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],  
            );
          },
        ),
        )
      ],
    );
  }
}
