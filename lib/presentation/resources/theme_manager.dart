
import 'package:flutter/material.dart';
import 'package:movie_app/presentation/resources/styles_manager.dart';
import 'package:movie_app/presentation/resources/values_manager.dart';

import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme(){
  return ThemeData(
    //main color
    primaryColor: ColorManager.primColor,
    primaryColorLight: ColorManager.lightPrim,
    primaryColorDark: ColorManager.darkPrim,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrim,

    //card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4),

    //appbar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primColor,
      elevation: AppSize.s4,
      shadowColor: ColorManager.lightPrim,
      titleTextStyle: getRegularStyle(
          fontSize: FontSize.s16,
          color: ColorManager.white,
      )
    ),

    //button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primColor,
      splashColor: ColorManager.lightPrim,
    ),

    //elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(fontSize: FontSize.s17,color: ColorManager.white),
        primary: ColorManager.primColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),

    //text theme
    textTheme: TextTheme(
        displayLarge: getSemiBoldStyle(
            color: ColorManager.darkGrey,
            fontSize: FontSize.s16),

        headlineLarge: getSemiBoldStyle(
            color: ColorManager.darkGrey,
            fontSize: FontSize.s16),

        headlineMedium: getRegularStyle(
            color: ColorManager.darkGrey,
            fontSize: FontSize.s14),

        titleMedium: getMediumStyle(
        color: ColorManager.primColor,
            fontSize: FontSize.s16),

      bodyLarge: getRegularStyle(color: ColorManager.grey1),
      bodySmall: getRegularStyle(color: ColorManager.grey)
    ),

    //input decoration theme (text form filed)
    inputDecorationTheme: InputDecorationTheme(
      //content padding
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      //hint style
      hintStyle: getRegularStyle(color: ColorManager.grey,fontSize: FontSize.s14),
      //label style
      labelStyle: getMediumStyle(color: ColorManager.grey,fontSize: FontSize.s14),
      //error Style
      errorStyle: getRegularStyle(color: ColorManager.error),
      //enabled Border
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.grey,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      //focused Border
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primColor,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      //error Border
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.error,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      //focused Error Border
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primColor,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

    ),




  );
}