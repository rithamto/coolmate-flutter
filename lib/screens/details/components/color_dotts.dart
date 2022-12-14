import 'package:flutter/material.dart';
import 'package:coolmate/components/rounded_icon_btn.dart';
import 'package:coolmate/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ColorDots extends StatefulWidget {
  const ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _ColorDotsSate createState() => _ColorDotsSate();
}
class _ColorDotsSate extends State<ColorDots>{
  int selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          ...List.generate(
            widget.product.mau.length,
            (index) => buildboder(index)
            // ColorDot(
            //   color: Color(widget.product.mau[index].hashCode),
            //   isSelected: index == selectedColor,
            // ),
          ),
          Spacer(),
          RoundedIconBtn(
            icon: Icons.remove,
            press: () {},
          ),
          SizedBox(width: getProportionateScreenWidth(20)),
          RoundedIconBtn(
            icon: Icons.add,
            showShadow: true,
            press: () {},
          ),
        ],
      ),
    );
  }
// }

// class ColorDot extends StatelessWidget {
//   const ColorDot({
//     Key? key,
//     required this.color,
//     this.isSelected = false,
//   }) : super(key: key);

//   final Color color;
//   final bool isSelected;

//   @override
//   Widget build(BuildContext context) {
  buildboder(int index){
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = index;
          print(selectedColor);
          print(index);
        });
      },
    child: Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            Border.all(color: selectedColor == index ? kPrimaryColor : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(widget.product.mau[index].hashCode),
          shape: BoxShape.circle,
        ),
      ),
    ),);
  }
}
