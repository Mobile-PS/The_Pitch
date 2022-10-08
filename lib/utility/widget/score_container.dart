import 'package:flutter/material.dart';
import 'package:the_new_pitchapp/utility/colors.dart';

class CoinContainer extends StatelessWidget {
  const CoinContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(top: 4),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: secondaryColor.withOpacity(0.5),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/ic_filtercolor.png',
            scale: 2.5,
          ),
        ],
      ),
    );
  }
}
