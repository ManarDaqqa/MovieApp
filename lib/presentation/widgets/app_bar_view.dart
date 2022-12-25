

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/presentation/resources/assets_manager.dart';

Widget AppBarView(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children:  [
      Padding(
        padding: EdgeInsets.only(top: 14),
        child: Center(
          child: SvgPicture.asset(ImageAssets.popcornIcon),
          ),
      ),
    ],
  );
}