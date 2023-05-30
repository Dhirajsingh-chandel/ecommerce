import 'package:flutter/material.dart';
import 'color_manager.dart';
import 'font_manager.dart';
import 'style_manager.dart';
import 'value_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(

    ///main color of the app

    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightGrey,
    primaryColorDark: ColorManager.darkGrey,
    disabledColor: ColorManager.grey1,
    accentColor: ColorManager.grey,
    splashColor: ColorManager.lightGrey,

    ///card view theme

    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4),

    ///App bar theme

    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.lightGrey,
      titleTextStyle:
          getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16),
    ),

    ///Button theme

    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.lightGrey,
    ),

    /// Elevated Button Theme

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(color: ColorManager.white),
            primary: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),

    /// Text theme

    textTheme: TextTheme(
        headline1: getSemiBoldStyle(
            color: ColorManager.black, fontSize: FontSize.s24),
        subtitle1: getRegularStyle(color: ColorManager.black, fontSize: FontSize.s16),
        subtitle2: getMediumStyle(
            color: ColorManager.black, fontSize: FontSize.s14),
        caption: getRegularStyle(color: ColorManager.black),
        bodyText1: getRegularStyle(color: ColorManager.black)),

    /// input theme

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(color: ColorManager.black),
      labelStyle: getRegularStyle(color: ColorManager.black),
      errorStyle: getRegularStyle(color: ColorManager.darkGrey),

      /// enable Border  theme

      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      /// focused Border  theme

      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      /// error Border  theme

      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      /// focused Error Border  theme

      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
  );
}
