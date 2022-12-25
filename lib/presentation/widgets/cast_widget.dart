import 'package:flutter/material.dart';
import 'package:movie_app/presentation/resources/color_manager.dart';
import 'package:movie_app/presentation/resources/styles_manager.dart';
import 'package:movie_app/presentation/resources/values_manager.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({Key? key, required this.imgUrl, required this.castName}) : super(key: key);

  final String imgUrl, castName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      padding: const EdgeInsets.only(left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: NetworkImage(imgUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: AppPadding.p8,bottom: AppPadding.p8),
                child: Text(
                  castName,
                  textAlign: TextAlign.center,
                  style: getLightStyle(color: ColorManager.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
