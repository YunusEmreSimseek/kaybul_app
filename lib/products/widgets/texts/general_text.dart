import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kartal/kartal.dart';
import 'package:kaybul_app/products/enums/font_size.dart';

class GeneralText extends Text {
  GeneralText(super.data,
      {super.key,
      required BuildContext context,
      double? fontSize,
      FontWeight? fontWeight,
      TextAlign? textAlign,
      int? maxLines})
      : super(
          maxLines: maxLines ?? 100,
          style: context.general.textTheme.titleLarge?.copyWith(
            fontSize: fontSize ?? FontSize.medium.value,
            fontWeight: fontWeight ?? FontWeight.normal,
          ),
          textAlign: textAlign ?? TextAlign.center,
        );
}
