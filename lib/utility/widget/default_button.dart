import 'package:flutter/material.dart';
import 'package:the_new_pitchapp/utility/colors.dart';


class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
     this.press,
    this.height,
    this.width
  }) : super(key: key);
  final String? text;
  final double? height,width;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () => press!(),
      child:
      Container(
      height: height,
      width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: buttonColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Text(text!,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)
        ],),
    ));
  }
}
