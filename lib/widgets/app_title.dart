import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/ui_helper.dart';

class AppTitle extends StatelessWidget {
  AppTitle({Key? key}) : super(key: key);
  String pokeBallUrl = 'images/pokeball.png';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: UIHelper.getAppTitleWidgetHeight(),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Pokedex",
              style: TextStyle(
                  fontSize: UIHelper.getPokeFontSize(), color: Colors.white),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              'images/pokeball.png',
              width: 100.w,
              height: 100.w,
              fit: BoxFit.fitWidth,
            ),
          )
        ],
      ),
    );
  }
}
