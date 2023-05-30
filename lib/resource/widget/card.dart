import 'package:flutter/material.dart';
import '../color_manager.dart';
import '../style_manager.dart';
import '../value_manager.dart';

class ReusableCard extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? title1;
  final String? subTitle1;
  final String? subTitle2;
  final String? description;
  final String? description1;
  final String? imageUrl;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final double? elevation;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;

  const ReusableCard({
    Key? key,
    this.title,
    this.title1,
    this.subTitle,
    this.subTitle1,
    this.subTitle2,
    this.description,
    this.description1,
    this.imageUrl,
    this.backgroundColor,
    this.width,
    this.height,
    this.elevation,
    this.borderRadius,
    this.padding,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(

      color: backgroundColor,
      elevation: elevation ?? 2.0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.greenAccent,
        ),
        borderRadius: BorderRadius.circular(borderRadius ?? 20.0),
      ),
      child: SizedBox(
        width: width ?? double.infinity,
        height: height ?? 150.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (imageUrl != null)
              SizedBox(
                height: 120,
                width: 100,
                child: Center(
                  child: Image.network(
                    imageUrl!,
                  ),
                ),
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: padding ?? EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (title != null)
                        SizedBox(
                          width: 170,
                          child: Text(
                            title!,overflow: TextOverflow.visible,
                            style: getMediumStyle(
                                color: ColorManager.black,
                                fontSize: AppSize.s16),
                          ),
                        ),
                      SizedBox(
                        height: 05,
                      ),
                      if (title1 != null)
                        SizedBox(
                          width: 170,
                          child: Text(
                            title1!,
                            style: getBoldStyle(
                                color: ColorManager.black,
                                fontSize: AppSize.s16),
                          ),
                        ),
                      SizedBox(
                        height: 05,
                      ),
                      if (subTitle2 != null)
                        SizedBox(
                          width: 170,
                          child: Text(
                            subTitle2!,
                            style: getLightStyle(
                                color: ColorManager.black,
                                fontSize: AppSize.s16),
                          ),
                        ),
                      SizedBox(
                        height: 05,
                      ),
                      if (subTitle != null)
                        SizedBox(
                          width: 170,
                          child: Text(
                            subTitle!,
                            style: getLightStyle(
                                color: ColorManager.black,
                                fontSize: AppSize.s16),
                          ),
                        ),
                      SizedBox(
                        height: 05,
                      ),
                      if (subTitle1 != null)
                        SizedBox(
                          width: 170,
                          child: Text(
                            subTitle1!,
                            style: getBoldStyle(
                                color: ColorManager.black,
                                fontSize: AppSize.s16),
                          ),
                        ),
                      SizedBox(
                        height: 05,
                      ),
                      if (description != null)
                        Text(
                          description!,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      SizedBox(
                        height: 05,
                      ),
                      if (description1 != null)
                        Text(
                          description1!,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TextCard extends StatelessWidget {
  final String? title;
  final Widget? widget;
  final String? subTitle;
  final String? title1;
  final String? subTitle1;
  final String? title2;
  final String? subTitle2;
  final String? description;
  final String? description1;
  final String? imageUrl;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final double? elevation;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;

  const TextCard({
    Key? key,
    this.title,
    this.title1,
    this.subTitle,
    this.subTitle1,
    this.description,
    this.imageUrl,
    this.backgroundColor,
    this.width,
    this.height,
    this.elevation,
    this.borderRadius,
    this.padding,
    this.onPressed,
    this.title2,
    this.subTitle2,
    this.description1,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      elevation: elevation ?? 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 20.0),
      ),
      child: SizedBox(
        width: width ?? double.infinity,
        height: height ?? 150.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (imageUrl != null)
              SizedBox(
                height: 120,
                width: 100,
                child: Center(
                  child: Image.network(
                    imageUrl!,
                  ),
                ),
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: padding ?? EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (title != null)
                        SizedBox(
                          width: 170,
                          child: Text(
                            title!,
                            style: getBoldStyle(
                                color: ColorManager.black,
                                fontSize: AppSize.s16),
                          ),
                        ),
                      SizedBox(
                        height: 05,
                      ),
                      if (title1 != null)
                        SizedBox(
                          width: 170,
                          child: Text(
                            title1!,
                            style: getBoldStyle(
                                color: ColorManager.black,
                                fontSize: AppSize.s16),
                          ),
                        ),
                      SizedBox(
                        height: 05,
                      ),
                      if (description != null)
                        Text(
                          description!,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      if (subTitle != null)
                        SizedBox(
                          width: 170,
                          child: Text(
                            subTitle!,
                            style: getBoldStyle(
                                color: ColorManager.black,
                                fontSize: AppSize.s16),
                          ),
                        ),
                      if (subTitle1 != null)
                        SizedBox(
                          width: 170,
                          child: Text(
                            subTitle1!,
                            style: getBoldStyle(
                                color: ColorManager.black,
                                fontSize: AppSize.s16),
                          ),
                        ),
                      if (subTitle2 != null)
                        SizedBox(
                          width: 170,
                          child: Text(
                            subTitle2!,
                            style: getBoldStyle(
                                color: ColorManager.black,
                                fontSize: AppSize.s16),
                          ),
                        ),
                      if (title2 != null)
                        SizedBox(
                          width: 170,
                          child: Text(
                            title2!,
                            style: getBoldStyle(
                                color: ColorManager.black,
                                fontSize: AppSize.s16),
                          ),
                        ),
                      if (description1 != null)
                        SizedBox(
                          width: 170,
                          child: Text(
                            description1!,
                            style: getBoldStyle(
                                color: ColorManager.black,
                                fontSize: AppSize.s16),
                          ),
                        )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
